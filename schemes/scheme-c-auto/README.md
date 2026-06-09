# 方案C: 全自动快速（LHM + Champ）

完全自动化的快速生成方案。适合快速原型、教育演示等场景。

## 🎯 工作流

```
羽毛球运动员照片
    ↓
LHM (一步完成: 3D + 骨架 + 姿态)
    ↓
Champ (AI自动生成动作)
    ↓
Godot (场景搭建)
```

## ⏱️ 耗时估算

- LHM生成: 1-2分钟
- Champ动作生成: 5-10分钟  
- Godot集成: 30分钟
- **总计: 2-3天**

## 📊 输出质量

- 模型顶点数: 40K-80K
- 纹理分辨率: 2K
- 动作自动化: 完全自动
- 最终FBX大小: 30-50MB

## 🚀 快速开始

```bash
cd schemes/scheme-c-auto
./setup.sh
python run_pipeline.py --image badminton_player.jpg
```

## 📝 详细步骤

### Step 1: LHM一步完成

```bash
python scripts/auto_generate_lhm.py \
    --image badminton_player.jpg \
    --output_dir results/
```

输出:
- player.fbx (包含骨架和基础动作)
- player_texture.png

### Step 2: Champ生成动作（可选）

```bash
python scripts/generate_motion_champ.py \
    --model results/player.fbx \
    --output results/player_animated.fbx
```

### Step 3: Godot运行

```bash
godot --path godot/project/
```

## 📂 项目文件

```
scheme-c-auto/
├── README.md
├── setup.sh
├── run_pipeline.py
├── configs/
│   └── lhm_config.yaml
├── scripts/
│   ├── auto_generate_lhm.py
│   ├── generate_motion_champ.py
│   └── batch_process.py
├── godot/
│   ├── project.godot
│   ├── scenes/
│   │   └── main.tscn
│   ├── scripts/
│   │   └── auto_player.gd
│   └── assets/
├── results/
└── examples/
```

## 🎬 输出示例

查看 `examples/` 目录获取完整示例。
