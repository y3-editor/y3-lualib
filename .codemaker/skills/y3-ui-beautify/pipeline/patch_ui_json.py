import argparse
import ast
import json
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, Optional, List

WORKSPACE = Path(r"e:/agentmap")
TREE_DIR = WORKSPACE / "ui_tree"
GEN_UI_TREE = WORKSPACE / ".codemaker/skills/y3-ui-json-generator/pipeline/gen_ui_tree.py"


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def save_json(path: Path, data: Any) -> None:
    path.write_text(json.dumps(data, ensure_ascii=False, indent=4), encoding="utf-8")


def find_node_by_path(root: Dict, path: str) -> Optional[Dict]:
    parts = [p for p in path.split('.') if p]
    current: Dict = root

    for part in parts:
        found = False
        if current.get('name') == part:
            found = True
            continue

        for child in current.get('children', []):
            if isinstance(child, dict) and child.get('name') == part:
                current = child
                found = True
                break

        if not found:
            return None

    return current


# Y3 引擎中需要 __tuple__ 标记的字段集合
_TUPLE_FIELDS = frozenset({
    'pos_data', 'size', 'font', 'text', 'alignment',
    'anchor', 'clip_rect', 'scroll_size',
})


def set_by_dotted_path(obj: Any, dotted_path: str, value: Any) -> None:
    """设置嵌套字段值。
    
    当路径形如 'alignment.items' 且父字段在 _TUPLE_FIELDS 中时，
    自动确保父字段包含 __tuple__: true 标记（Y3 引擎要求）。
    """
    parts = [p for p in dotted_path.split('.') if p]
    cur = obj

    for i, part in enumerate(parts):
        is_last = i == len(parts) - 1

        if isinstance(cur, list):
            idx = int(part)
            if is_last:
                cur[idx] = value
                return
            cur = cur[idx]
            continue

        if not isinstance(cur, dict):
            raise TypeError(f"Cannot set path '{dotted_path}': non-container at '{part}'")

        if is_last:
            cur[part] = value
            # 如果设置的是 items 且父级是 __tuple__ 字段，自动补 __tuple__ 标记
            if part == 'items' and isinstance(cur, dict) and '__tuple__' not in cur:
                cur['__tuple__'] = True
            return

        if part not in cur or cur[part] is None:
            nxt = parts[i + 1]
            if nxt == 'items' and part in _TUPLE_FIELDS:
                # 为 __tuple__ 字段自动创建正确结构
                cur[part] = {'__tuple__': True, 'items': []}
            elif nxt.isdigit():
                cur[part] = []
            else:
                cur[part] = {}

        cur = cur[part]


def parse_field_expr(expr: str) -> (str, Any):
    # expr: "alignment.items=[2,8]"
    if '=' not in expr:
        raise ValueError("--set-field must be in form <field_path>=<value>")
    left, right = expr.split('=', 1)
    field_path = left.strip()
    right = right.strip()

    try:
        value = ast.literal_eval(right)
    except Exception:
        value = right

    return field_path, value


def patch_with_config(ui_data: Dict, config: Dict[str, Any]) -> Dict[str, Any]:
    report = {"success": [], "not_found": [], "errors": []}

    def apply_set(node: Dict, set_map: Dict[str, Any]) -> None:
        for k, v in set_map.items():
            set_by_dotted_path(node, k, v)

    def find_all_nodes_by_name(root: Any, name: str, results: Optional[List[Dict]] = None) -> List[Dict]:
        if results is None:
            results = []
        if isinstance(root, dict):
            if root.get('name') == name:
                results.append(root)
            for child in root.get('children', []):
                find_all_nodes_by_name(child, name, results)
        elif isinstance(root, list):
            for x in root:
                find_all_nodes_by_name(x, name, results)
        return results

    for path, props in config.items():
        try:
            if '*' in path:
                name = path.replace('*', '').strip('.')
                nodes = find_all_nodes_by_name(ui_data, name)
                if not nodes:
                    report['not_found'].append(path)
                    continue
                for node in nodes:
                    if isinstance(props, dict) and 'set' in props:
                        apply_set(node, props.get('set') or {})
                    report['success'].append(path)
            else:
                node = find_node_by_path(ui_data, path)
                if node is None:
                    report['not_found'].append(path)
                    continue
                if isinstance(props, dict) and 'set' in props:
                    apply_set(node, props.get('set') or {})
                report['success'].append(path)
        except Exception as e:
            report['errors'].append({"path": path, "error": str(e)})

    return report


def main():
    ap = argparse.ArgumentParser(description='Patch Y3 UI JSON with tree-based path hinting')
    ap.add_argument('ui_json', help='UI JSON path')

    # New explicit mode (recommended)
    ap.add_argument('--set-node', dest='set_nodes', action='append', default=[], help='node path or node name (can be partial)')
    ap.add_argument('--set-field', dest='set_fields', action='append', default=[], help='field expr, e.g. "alignment.items=[2,8]"')

    # Config mode
    ap.add_argument('--config', dest='config', default=None, help='patch config json path')

    ap.add_argument('--no-tree', action='store_true', help='disable tree hinting')
    args = ap.parse_args()

    if len(args.set_nodes) != len(args.set_fields):
        print("[ERR] --set-node 和 --set-field 必须成对出现，且数量一致")
        sys.exit(2)

    ui_path = Path(args.ui_json)
    data = load_json(ui_path)

    tree_paths: List[str] = []
    if not args.no_tree:
        try:
            tree_path = ensure_tree(ui_path)
            tree_data = load_json(tree_path)
            tree_paths = collect_paths_from_tree(tree_data)
        except Exception as e:
            print(f"[WARN] Tree 提示不可用: {e}")

    report = {"success": [], "not_found": [], "errors": []}

    # config mode
    if args.config:
        cfg = load_json(Path(args.config))
        r = patch_with_config(data, cfg)
        for k in report:
            report[k].extend(r.get(k, []))

    # explicit set mode
    for node_query, field_expr in zip(args.set_nodes, args.set_fields):
        try:
            field_path, value = parse_field_expr(field_expr)

            node = find_node_by_path(data, node_query)
            chosen_path = node_query

            if node is None and tree_paths:
                cands = suggest_paths(tree_paths, node_query)
                chosen = choose_path_interactive(cands)
                if chosen is None:
                    report['not_found'].append(node_query)
                    continue
                node = find_node_by_path(data, chosen)
                chosen_path = chosen

            if node is None:
                report['not_found'].append(node_query)
                continue

            set_by_dotted_path(node, field_path, value)
            report['success'].append({"node": chosen_path, "field": field_path})
        except Exception as e:
            report['errors'].append({"node": node_query, "field": field_expr, "error": str(e)})

    # 保存修改（只在有修改时保存）
    if report['success'] or args.config:
        save_json(ui_path, data)

    # print report
    if report['success']:
        print(f"[OK] success: {len(report['success'])}")
    if report['not_found']:
        print(f"[WARN] not_found: {len(report['not_found'])}")
        for x in report['not_found']:
            print('  -', x)
    if report['errors']:
        print(f"[ERR] errors: {len(report['errors'])}")
        for e in report['errors']:
            print('  -', e)


# ---------------- Tree helpers (must be defined before main) ----------------


def ensure_tree(ui_json_path: Path) -> Path:
    TREE_DIR.mkdir(parents=True, exist_ok=True)
    panel_name = ui_json_path.stem
    tree_path = TREE_DIR / f"{panel_name}_Tree.json"

    if tree_path.exists():
        return tree_path

    if not GEN_UI_TREE.exists():
        raise FileNotFoundError(f"gen_ui_tree.py not found: {GEN_UI_TREE}")

    print(f"[INFO] 未找到 Tree，正在生成: {tree_path}")
    subprocess.check_call([sys.executable, str(GEN_UI_TREE), str(WORKSPACE)])

    if not tree_path.exists():
        raise FileNotFoundError(f"Tree generation finished but file not found: {tree_path}")

    return tree_path


def collect_paths_from_tree(tree_data: Any) -> List[str]:
    paths: List[str] = []

    def walk(node: Any, prefix: List[str]):
        if not isinstance(node, dict):
            return
        name = node.get('name')
        if name:
            cur = prefix + [name]
            paths.append('.'.join(cur))
        else:
            cur = prefix

        for child in node.get('children', []) or []:
            walk(child, cur)

    walk(tree_data, [])
    return paths


def suggest_paths(tree_paths: List[str], query: str, limit: int = 20) -> List[str]:
    q = query.lower()
    scored = []
    for p in tree_paths:
        pl = p.lower()
        if q in pl:
            score = (0 if pl.endswith(q) else 1, len(pl))
            scored.append((score, p))
    scored.sort(key=lambda x: x[0])
    return [p for _, p in scored[:limit]]


def choose_path_interactive(candidates: List[str]) -> Optional[str]:
    if not candidates:
        return None
    print("\n未找到精确路径，候选如下：")
    for i, p in enumerate(candidates, 1):
        print(f"  [{i}] {p}")
    print("  [0] 取消")

    while True:
        s = input("请选择编号: ").strip()
        if not s.isdigit():
            continue
        idx = int(s)
        if idx == 0:
            return None
        if 1 <= idx <= len(candidates):
            return candidates[idx - 1]