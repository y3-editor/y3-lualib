# -*- coding: utf-8 -*-
"""画板布局体检：越界 / 安全区外 / 面板互相重叠。

Y3 口径：画布 1920×1080，原点在左下角；`pos_data.items[0..1]` 是子节点相对
**父节点左下角**的偏移，节点自身按中心定位。

用法：
    python check_layout.py                          # 检查 ui 目录下全部画板
    python check_layout.py --all                    # 检查 maps/*/ui 下所有画板
    python check_layout.py MyPanel --overlap-pairs ""      # 只查单个画板
    python check_layout.py --ui-dir <ui目录>
    python check_layout.py --safe-x 100,1820 --safe-y 24,1056
    python check_layout.py --templates hud_hp_bar,skill_slot_1
    python check_layout.py --include-official       # 连 GameHUD 一起查

退出码：0 = 全部通过；1 = 有越界 / 安全区外 / 重叠。

口径说明：
- 横向安全区只针对**未开启左右适配**的控件；已开启适配的控件按边距锚定，跳过此项。
- 纵向留白同理：适配到上/下边缘的控件跳过提示；未适配的只影响观感，不计入失败。
- 重叠检查只对**同时可见**的画板有意义；默认跳过，用 --overlap-pairs 显式指定。
"""
import argparse
import glob
import json
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

W, H = 1920.0, 1080.0

# 官方组件/模板宿主：内部子节点用的是模板相对坐标，量了没有意义，只量宿主本身。
LEAF_TYPES = {16, 17, 18, 20, 21, 41, 42}

# 参与安全区与重叠检查的可见控件类型（容器 7 / 根 2 不参与）。
CONTENT_TYPES = {1, 3, 4, 5, 10, 15, 16, 17, 20, 21, 41, 42}


def num(v, default=0.0):
    try:
        return float(v)
    except (TypeError, ValueError):
        return default


def find_ui_dir():
    """从当前目录往上找 maps/*/ui。"""
    cur = os.getcwd()
    for _ in range(6):
        hits = sorted(glob.glob(os.path.join(cur, "maps", "*", "ui")))
        if hits:
            return hits[0]
        parent = os.path.dirname(cur)
        if parent == cur:
            break
        cur = parent
    return None


def load_panel(path):
    with open(path, "rb") as fh:
        return json.loads(fh.read().decode("utf-8"))


class Walker:
    def __init__(self, templates):
        self.templates = set(templates)
        self.nodes = []

    def walk(self, node, path="", origin=(0.0, 0.0)):
        name = node.get("name") or "?"
        pos = (node.get("pos_data") or {}).get("items") or []
        px = num(pos[0]) if len(pos) >= 1 else 0.0
        py = num(pos[1]) if len(pos) >= 2 else 0.0
        cx, cy = origin[0] + px, origin[1] + py

        size = node.get("size")
        items = size.get("items") if isinstance(size, dict) else size
        items = items or []
        w = num(items[0]) if len(items) > 0 else 0.0
        h = num(items[1]) if len(items) > 1 else 0.0

        rect = (cx - w / 2.0, cy - h / 2.0, cx + w / 2.0, cy + h / 2.0)
        full = path + "/" + name if path else "/" + name
        children = node.get("children") or []
        adapter = node.get("adapter_option") or []
        self.nodes.append({
            "path": full,
            "name": name,
            "type": node.get("type"),
            "rect": rect,
            "size": (w, h),
            "leaf": (not children) or name in self.templates or node.get("type") in LEAF_TYPES,
            "adapter": bool(node.get("open_adapter")),
            "adapter_option": adapter if isinstance(adapter, list) else [],
        })

        if node.get("type") in LEAF_TYPES or name in self.templates:
            return
        for child in children:
            self.walk(child, full, (rect[0], rect[1]))


def is_background(node):
    return node["name"].endswith("_bg") or "bg_img" in node["name"]


def is_full_screen(node):
    w, h = node["size"]
    return w >= W * 0.95 and h >= H * 0.95


def content_nodes(nodes):
    return [n for n in nodes
            if n["type"] in CONTENT_TYPES
            and not is_background(n)
            and not is_full_screen(n)]


def anchored_x(node):
    """是否已用左/右适配锚定（锚定后不再按静态 x 判安全区）。"""
    if not node["adapter"]:
        return False
    opt = node["adapter_option"]
    return len(opt) >= 4 and (bool(opt[2]) or bool(opt[3]))


def anchored_y(node):
    """是否已用上/下适配锚定。"""
    if not node["adapter"]:
        return False
    opt = node["adapter_option"]
    return len(opt) >= 4 and (bool(opt[0]) or bool(opt[1]))


def overlaps(a, b):
    return a[0] < b[2] and b[0] < a[2] and a[1] < b[3] and b[1] < a[3]


def main():
    ap = argparse.ArgumentParser(description="画板布局体检（越界 / 安全区 / 重叠）")
    ap.add_argument("panels", nargs="*", help="画板名，不带 .json")
    ap.add_argument("--all", action="store_true", help="检查 ui 目录下所有画板")
    ap.add_argument("--ui-dir", help="ui 目录；默认自动找 maps/*/ui")
    ap.add_argument("--safe-x", default="100,1820", help="未适配控件的安全区左右边界，默认 100,1820")
    ap.add_argument("--safe-y", default="24,1056", help="安全区上下边界，默认 24,1056")
    ap.add_argument("--templates", default="", help="额外的模板宿主控件名，逗号分隔")
    ap.add_argument("--include-official", action="store_true", help="连官方画板一起检查")
    ap.add_argument("--tolerance", type=float, default=0.5, help="容差，默认 0.5 设计像素")
    ap.add_argument("--overlap-pairs", default="",
                    help="同时可见、需要互查重叠的画板对，逗号分隔；空串=跳过")
    args = ap.parse_args()

    ui_dir = args.ui_dir or find_ui_dir()
    if not ui_dir or not os.path.isdir(ui_dir):
        raise SystemExit("找不到 ui 目录，请用 --ui-dir 指定")

    safe_x0, safe_x1 = [float(x) for x in args.safe_x.split(",")]
    safe_y0, safe_y1 = [float(y) for y in args.safe_y.split(",")]
    templates = {x.strip() for x in args.templates.split(",") if x.strip()}
    tol = args.tolerance

    available = sorted(os.path.splitext(os.path.basename(p))[0]
                       for p in glob.glob(os.path.join(ui_dir, "*.json")))
    if args.panels:
        names = [p[:-5] if p.endswith(".json") else p for p in args.panels]
    elif args.all:
        names = available
    else:
        names = available
    if not args.include_official:
        names = [n for n in names if n != "GameHUD"]

    print("ui 目录：%s" % ui_dir)
    print("安全区：x[%.0f, %.0f] y[%.0f, %.0f]\n" % (safe_x0, safe_x1, safe_y0, safe_y1))

    panels = {}
    failures = 0
    for name in names:
        path = os.path.join(ui_dir, name + ".json")
        if not os.path.isfile(path):
            print("[!] 缺少画板：%s" % path)
            failures += 1
            continue
        walker = Walker(templates)
        walker.walk(load_panel(path))
        panels[name] = walker.nodes

        out_of_bounds = [n for n in walker.nodes
                         if n["rect"][0] < -tol or n["rect"][1] < -tol
                         or n["rect"][2] > W + tol or n["rect"][3] > H + tol]
        content = content_nodes(walker.nodes)
        outside_safe = [n for n in content
                        if not anchored_x(n)
                        and (n["rect"][0] < safe_x0 - tol or n["rect"][2] > safe_x1 + tol)]
        tight_y = [n for n in content
                   if not anchored_y(n)
                   and (n["rect"][1] < safe_y0 - tol or n["rect"][3] > safe_y1 + tol)]
        anchored_skipped = sum(1 for n in content if anchored_x(n))

        failures += len(out_of_bounds) + len(outside_safe)
        print("== %s == 节点 %d，越界 %d，横向安全区外 %d（已适配锚定跳过 %d）"
              % (name, len(walker.nodes), len(out_of_bounds), len(outside_safe), anchored_skipped))
        for n in out_of_bounds[:20]:
            r = n["rect"]
            print("   [!] 越界   %-48s type=%-3s x[%.0f,%.0f] y[%.0f,%.0f]"
                  % (n["path"], n["type"], r[0], r[2], r[1], r[3]))
        for n in outside_safe[:20]:
            r = n["rect"]
            print("   [!] 安全区 %-48s type=%-3s x[%.0f,%.0f] y[%.0f,%.0f]"
                  % (n["path"], n["type"], r[0], r[2], r[1], r[3]))
        if tight_y:
            print("   [提示] 上下留白不足（不计失败）：%s"
                  % ["%s y[%.0f,%.0f]" % (n["path"], n["rect"][1], n["rect"][3])
                     for n in tight_y[:6]])
        print()

    pairs_spec = [p for p in args.overlap_pairs.split(",") if ":" in p]
    if pairs_spec:
        print("== 同时可见面板的重叠检查（只比叶子/模板宿主，忽略底图与全屏容器） ==")
        pairs = 0
        for spec in pairs_spec:
            a, b = [x.strip() for x in spec.split(":", 1)]
            if a not in panels or b not in panels:
                continue
            hits = []
            for n1 in content_nodes(panels[a]):
                if not n1["leaf"]:
                    continue
                for n2 in content_nodes(panels[b]):
                    if not n2["leaf"]:
                        continue
                    if overlaps(n1["rect"], n2["rect"]):
                        hits.append((n1["path"], n2["path"]))
            if hits:
                pairs += len(hits)
                print("   [!] %s × %s：%d 对" % (a, b, len(hits)))
                for p1, p2 in hits[:10]:
                    print("       %s  ×  %s" % (p1, p2))
        failures += pairs
        if not pairs:
            print("   通过：没有重叠")
        print()

    if failures:
        print("结果：发现 %d 处问题" % failures)
        return 1
    print("结果：通过")
    return 0


if __name__ == "__main__":
    sys.exit(main())
