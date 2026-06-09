# 方案B: 高效平衡（PIFuHD/LHM + Blender + Champ）

结合质量与效率的混合方案。适合中等规模的商业项目。

## 🎯 工作流

```
羽毛球运动员照片 + 动作视频
    ↓
PIFuHD/LHM (生成3D基础模型)
    ↓
Blender (快速优化 + Rigify绑定)
    ↓
Champ (AI生成动作)
    ↓
Godot (场景搭建)
```

## ⏱️ 耗时估算

- 模型生成: 5-10分钟
- Blender优化: 1小时
- 动作生成: 5-15分钟
- Godot集成: 1-2小时
- **总计: 5-8天(含渲染优化)**

## 📊 输出质量

- 模型顶点数: 80K-150K
- 纹理分辨率: 2K-4K
- 动作流畅度: 90%+
- 最终FBX大小: 50-100MB

## 🚀 快速开始

```bash
cd schemes/scheme-b-hybrid
./setup.sh
python run_pipeline.py \
    --image badminton_player.jpg \
    --video badminton_action.mp4
```

## 📝 详细步骤

### Step 1: 模型生成（PIFuHD或LHM）

```bash
# 使用PIFuHD
python scripts/generate_model.py --model pifuhd --image player.jpg

# 或使用LHM
python scripts/generate_model.py --model lhm --image player.jpg
```

### Step 2: Blender优化

```bash
blender -b -P scripts/quick_optimize.py player.fbx
```

### Step 3: Champ生成动作

```bash
python scripts/generate_animation_champ.py \
    --model player.fbx \
    --video badminton_action.mp4 \
    --output player_animated.fbx
```

### Step 4: Godot集成

```bash
godot --path godot/project/
```

## 📂 项目文件

```
scheme-b-hybrid/
├── README.md
├── setup.sh
├── run_pipeline.py
├── configs/
│   ├── pifuhd_config.yaml
│   ├── lhm_config.yaml
│   └── champ_config.yaml
├── scripts/
│   ├── generate_model.py        # 模型生成脚本
│   ├── quick_optimize.py        # 快速优化脚本
│   ├── generate_animation_champ.py
│   └── export_fbx.py
├── blender/
│   └── scripts/
│       └── quick_rig.py         # 快速绑定脚本
├── godot/
│   ├── project.godot
│   ├── scenes/
│   │   └── main.tscn
│   ├── scripts/
│   │   └── player_controller.gd
│   └── assets/
├── models/
├── animations/
└── examples/
```

## 🎬 输出示例

查看 `examples/` 目录获取完整示例。
