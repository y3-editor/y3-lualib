import os
import json

# 脚本现在在 scripts/ 目录下，模板在 data_template/ 目录下
SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
path = os.path.join(SKILL_DIR, "data_template")

templates = [f for f in os.listdir(path) if f.endswith('.json')]

print("模板名称 | 模型 | 头像 | 攻击类型 | 弹道 | 受击")
print("-" * 80)

for t in templates:
    with open(os.path.join(path, t), encoding='utf-8') as f:
        d = json.load(f)
    s = d.get('simple_common_atk', {})
    model = d.get('model', 0)
    icon = d.get('icon', 0)
    atk_type = d.get('common_atk_type', 0)
    trajectory = s.get('attack_trajectory', {}).get('effect', 0)
    hit = s.get('hit_effect', {}).get('effect', 0)
    print(f"{t} | {model} | {icon} | {atk_type} | {trajectory} | {hit}")