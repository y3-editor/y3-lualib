# -*- coding: utf-8 -*-
"""打印画板控件的完整父路径与 uid，用于校验控件是否真的嵌套在目标父节点下。

用法：
  py -3 dump_ui_paths.py --map EntryMap --panel TowerUpgradePanel
  py -3 dump_ui_paths.py --map EntryMap --panel WaveInfoBar --leaf-only
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


def walk(node, path, leaf_only):
    children = node.get("children") or []
    if (not leaf_only) or (not children):
        print(f"{path}\ttype={node.get('type')}\tuid={node.get('uid')}")
    for child in children:
        walk(child, path + "." + child.get("name", ""), leaf_only)


def main():
    ap = argparse.ArgumentParser(description="打印 UI 控件完整路径")
    ap.add_argument("--root", default=None)
    ap.add_argument("--map", dest="map_name", default="EntryMap")
    ap.add_argument("--panel", default=None, help="画板名；不传则处理 ui 目录下全部画板")
    ap.add_argument("--leaf-only", action="store_true", help="只打印叶子控件")
    args = ap.parse_args()

    root = find_root(args.root)
    ui_dir = os.path.join(root, "maps", args.map_name, "ui")
    if args.panel:
        names = [args.panel]
    else:
        names = [os.path.splitext(f)[0] for f in os.listdir(ui_dir) if f.endswith(".json")]

    for name in names:
        path = os.path.join(ui_dir, name + ".json")
        if not os.path.isfile(path):
            print(f"[!] 画板不存在: {path}")
            continue
        data = json.load(open(path, encoding="utf-8"))
        print(f"== {name} ==")
        walk(data, name, args.leaf_only)


if __name__ == "__main__":
    main()
