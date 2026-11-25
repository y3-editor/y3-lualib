# -*- coding: utf-8 -*-
"""隐藏 / 恢复项目自带的官方 GameHUD。

为什么需要脚本：GameHUD 约 2.7 MB、近千节点，会占据屏幕底部和右侧，
直接盖住自定义 HUD。执行 UI 流程时必须显式把它根节点设为不可见，
但不要删除 / 改名 / 用自建画板覆盖同名文件。

用法：
  py -3 hide_gamehud.py --map EntryMap
  py -3 hide_gamehud.py --map EntryMap --show
  py -3 hide_gamehud.py --map EntryMap --dry-run
  py -3 hide_gamehud.py --map EntryMap --no-hotfix

默认流程：写盘 -> hotfix_ui_editor -> 等 3 秒 -> save_editor。
退出码：0 成功；1 文件缺失 / 写盘失败 / MCP 失败。
"""
from __future__ import annotations

import argparse
import json
import os
import shutil
import sys
import time

sys.stdout.reconfigure(encoding="utf-8", errors="replace")

SKILL_DIR = os.path.dirname(os.path.abspath(__file__))
BUILDER_DIR = os.path.abspath(os.path.join(SKILL_DIR, "..", "..", "eca-json-builder"))
if BUILDER_DIR not in sys.path:
    sys.path.insert(0, BUILDER_DIR)


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


def count_nodes(node):
    total = 1
    for child in node.get("children") or []:
        total += count_nodes(child)
    return total


def main():
    ap = argparse.ArgumentParser(description="隐藏 / 恢复官方 GameHUD")
    ap.add_argument("--map", default="EntryMap", help="地图名（默认 EntryMap）")
    ap.add_argument("--root", default=None, help="工程根（默认自动探测）")
    ap.add_argument("--show", action="store_true", help="恢复显示（visible=true）")
    ap.add_argument("--dry-run", action="store_true", help="只打印，不写盘")
    ap.add_argument("--no-hotfix", action="store_true", help="只写盘，不调用 MCP 热更/保存")
    args = ap.parse_args()

    root = args.root or find_root()
    path = os.path.join(root, "maps", args.map, "ui", "GameHUD.json")
    if not os.path.isfile(path):
        print("[!] 找不到 GameHUD：%s" % path)
        return 1

    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)

    target = bool(args.show)
    old = data.get("visible")
    nodes = count_nodes(data)
    print("GameHUD：%s" % path)
    print("  根节点 visible：%r -> %r（节点数 %d）" % (old, target, nodes))

    if args.dry_run:
        print("  [dry-run] 不写盘")
        return 0

    data["visible"] = target
    backup = path + ".bak"
    shutil.copy2(path, backup)
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    print("  已写盘（备份：%s）" % backup)

    if args.no_hotfix:
        print("  已跳过 MCP 热更/保存；请手动 hotfix_ui_editor -> 等 3 秒 -> save_editor")
        return 0

    try:
        from mcp_client import editor_client
        client = editor_client(root)
        text, _ = client.call("hotfix_ui_editor", {})
        print("  hotfix_ui_editor：%s" % (text or "(无返回)"))
        time.sleep(3)
        text, _ = client.call("save_editor", {})
        print("  save_editor：%s" % (text or "(无返回)"))
    except Exception as exc:
        print("  [!] MCP 调用失败：%s" % exc)
        print("      文件已写盘；请在编辑器里手动执行 hotfix_ui_editor -> 等 3 秒 -> save_editor")
        return 1

    # 回读确认
    with open(path, "r", encoding="utf-8") as f:
        after = json.load(f).get("visible")
    print("  回读 visible = %r" % after)
    return 0 if after == target else 1


if __name__ == "__main__":
    sys.exit(main())
