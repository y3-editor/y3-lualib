"""Quick regression test for template scaling fix."""
import sys, os
sys.path.insert(0, os.path.dirname(__file__))
from html_to_y3_ui import Y3UIHTMLParser

def check_bounds(children, pw, ph, violations, path=""):
    for c in children:
        name = c.get("name", "?")
        full_path = f"{path}/{name}"
        size = c.get("size")
        if isinstance(size, dict):
            cw, ch = size["items"][0], size["items"][1]
        elif isinstance(size, list) and len(size) >= 2:
            cw, ch = float(size[0]), float(size[1])
        else:
            # No size field (e.g. type=17) — skip bounds check for this node
            # but still recurse using parent dims
            check_bounds(c.get("children", []), pw, ph, violations, full_path)
            continue
        if cw <= 0 and ch <= 0:
            check_bounds(c.get("children", []), pw, ph, violations, full_path)
            continue
        pos_items = c.get("pos_data", {}).get("items", [pw / 2, ph / 2])
        cx, cy = pos_items[0], pos_items[1]
        # Allow 1px tolerance
        if cx - cw / 2 < -1 or cx + cw / 2 > pw + 1 or cy - ch / 2 < -1 or cy + ch / 2 > ph + 1:
            violations.append(
                f"  OVERFLOW: {full_path}  cx={cx:.1f} cy={cy:.1f}  "
                f"size={cw:.1f}x{ch:.1f}  parent={pw:.1f}x{ph:.1f}"
            )
        # Use effective size for children recursion
        eff_w = cw if cw > 0 else pw
        eff_h = ch if ch > 0 else ph
        check_bounds(c.get("children", []), eff_w, eff_h, violations, full_path)


def run_test(template_name, orig_w, orig_h, new_w, new_h):
    p = Y3UIHTMLParser()
    attrs = {
        "data-template": template_name,
        "data-name": f"{template_name}_test",
        "data-x": "0", "data-y": "0",
        "data-w": str(new_w), "data-h": str(new_h),
    }
    p.stack = [({'size': [1920, 1080], 'children': []}, [])]
    node = p._build_template_node(attrs, template_name)
    if node is None:
        print(f"[SKIP] Template '{template_name}' not found")
        return

    w, h = node["size"]
    violations = []
    check_bounds(node.get("children", []), w, h, violations)

    status = "PASS" if not violations else "FAIL"
    scale_x = new_w / orig_w
    scale_y = new_h / orig_h
    print(f"[{status}] {template_name}: {orig_w}x{orig_h} -> {new_w}x{new_h}  "
          f"(scale {scale_x:.2f}x, {scale_y:.2f}x)  "
          f"violations={len(violations)}")
    for v in violations:
        print(v)


if __name__ == "__main__":
    # card: default 354x500
    run_test("card", 354, 500, 177, 250)   # 0.5x scale
    run_test("card", 354, 500, 300, 420)   # ~0.85x scale
    run_test("card", 354, 500, 354, 500)   # 1x (no change)
    run_test("card", 354, 500, 500, 700)   # 1.4x scale (larger)
    # skill: default 150x230
    run_test("skill", 150, 230, 100, 150)  # small
    run_test("skill", 150, 230, 80, 120)   # very small
    # hp_bar: default 256x38
    run_test("hp_bar", 256, 38, 200, 30)
    run_test("hp_bar", 256, 38, 512, 76)   # 2x scale
