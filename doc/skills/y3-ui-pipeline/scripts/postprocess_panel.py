# -*- coding: utf-8 -*-
"""画板生成后处理：删除常驻画板根节点的全屏底图。

`html_to_y3_ui.py` 会给每个 layout 自动补背景图；画板根 layout 是 1920×1080，
于是常驻 HUD / 物品栏会各自叠一张全屏半透明底图，表现是“整张地图蒙了一层灰”。

用法：
  py -3 postprocess_panel.py --map <地图> --strip-root-bg MyHUD,MyItemBar
  py -3 postprocess_panel.py --map <地图> --strip-root-bg MyHUD --dry-run

只删除根 layout 的直接子节点 `block_bg` / `<画板名>_bg`，不动其它节点和 uid。
"""
from __future__ import annotations

import argparse
import json
import os
import sys

sys.stdout.reconfigure(encoding="utf-8", errors="replace")


def find_root(start=None):
    cur = os.path.abspath(start or os.getcwd())
    for _ in range(8):
        if os.path.isdir(os.path.join(cur, "maps")):
            return cur
        parent = os.path.dirname(cur)
        if parent == cur:
            break
        cur = parent
    return os.path.abspath(start or os.getcwd())


def main():
    ap = argparse.ArgumentParser(description="画板后处理：删除常驻画板根节点全屏底图")
    ap.add_argument("--map", default="EntryMap", help="地图名（默认 EntryMap）")
    ap.add_argument("--root", default=None, help="工程根（默认自动探测）")
    ap.add_argument("--strip-root-bg", required=True,
                    help="要删除根底图的画板名，逗号分隔，如 MyHUD,MyItemBar")
    ap.add_argument("--dry-run", action="store_true", help="只打印，不写盘")
    args = ap.parse_args()

    root = args.root or find_root()
    panels = [p.strip() for p in args.strip_root_bg.split(",") if p.strip()]
    for panel in panels:
        path = os.path.join(root, "maps", args.map, "ui", panel + ".json")
        if not os.path.isfile(path):
            print("[!] 找不到画板：%s" % path)
            return 1
        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)
        children = data.get("children") or []
        if not children:
            print("[!] %s 没有根 layout" % panel)
            return 1
        root_layout = children[0]
        before = len(root_layout.get("children") or [])
        targets = {"block_bg", panel + "_bg"}
        kept = [c for c in (root_layout.get("children") or [])
                if c.get("name") not in targets]
        removed = before - len(kept)
        root_layout["children"] = kept
        print("%s：根节点子节点 %d -> %d（删除 %d 个全屏底图）"
              % (panel, before, len(kept), removed))
        if args.dry_run:
            continue
        with open(path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=4)
        print("  已写盘：%s" % path)
    return 0


if __name__ == "__main__":
    sys.exit(main())
