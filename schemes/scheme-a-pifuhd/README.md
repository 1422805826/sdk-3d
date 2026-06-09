# 方案A: 照片级质量（PIFuHD + Blender + ArmorPaint）

最高质量的3D人物制作方案。适合专业级的虚拟人、虚拟试衣等场景。

## 🎯 工作流

```
羽毛球运动员照片
    ↓
PIFuHD (高精度3D重建)
    ↓
Blender (模型优化 + Rigify绑定)
    ↓
ArmorPaint (纹理增强)
    ↓
Godot (场景搭建)
```

## ⏱️ 耗时估算

- PIFuHD生成: 8-12分钟
- Blender优化: 2-3小时
- 绑定权重调整: 2-3小时
- 纹理优化: 2-3小时
- **总计: 10-15天(含手工优化)**

## 📊 输出质量

- 模型顶点数: 150K-300K
- 纹理分辨率: 4K PBR
- 衣服褶皱还原度: 95%+
- 皮肤细节: 微观毛孔级
- 最终FBX大小: 80-150MB

## 🚀 快速开始

```bash
cd schemes/scheme-a-pifuhd
./setup.sh
python run_pipeline.py --image badminton_player.jpg
```

## 📝 详细步骤

### Step 1: PIFuHD生成

```bash
cd schemes/scheme-a-pifuhd/scripts
python generate_model.py \
    --image ../examples/badminton_player.jpg \
    --output ../models/pifuhd_output.obj \
    --checkpoint ../../pifuhd/checkpoints/pifuhd.pt
```

### Step 2: Blender优化

```bash
blender -b ../blender/scenes/badminton_player.blend \
    -P ../scripts/optimize_pifuhd_model.py
```

### Step 3: 纹理处理

在ArmorPaint中:
1. 导入优化后的FBX
2. 使用PIFuHD输出的纹理
3. 手工增强细节
4. 导出PBR贴图组

### Step 4: Godot集成

```bash
godot --path godot/project/
```

## 📂 项目文件

```
scheme-a-pifuhd/
├── README.md
├── setup.sh
├── run_pipeline.py
├── scripts/
│   ├── generate_model.py       # PIFuHD生成脚本
│   ├── optimize_pifuhd_model.py # Blender优化脚本
│   ├── create_animations.py     # 动画制作脚本
│   └── export_fbx.py           # FBX导出脚本
├── blender/
│   ├── scenes/
│   │   └── badminton_player.blend
│   ├── scripts/
│   │   ├── rigging.py          # Rigify绑定脚本
│   │   └── material_setup.py   # 材质设置脚本
│   └── renders/
├── godot/
│   ├── project.godot
│   ├── scenes/
│   │   ├── player_scene.tscn
│   │   ├── court_scene.tscn
│   │   └── main.tscn
│   ├── scripts/
│   │   ├── player_controller.gd
│   │   └── animation_manager.gd
│   └── assets/
│       └── models/
├── models/                     # 输出目录
├── textures/                   # 纹理输出目录
└── examples/
    ├── badminton_player.jpg    # 参考照片
    └── output_example.fbx      # 示例输出
```

## 🎬 输出示例

查看 `examples/` 目录获取完整示例。

## 💡 最佳实践

1. **输入图片**: 全身照，背景干净，光线充足
2. **分辨率**: 建议4K以上
3. **角度**: 可多角度扫描改进效果
4. **纹理**: PIFuHD输出后可在ArmorPaint进一步增强
5. **骨架**: 使用Rigify自动绑定，手工调整权重

## 🔗 相关文档

- [PIFuHD官方](https://github.com/facebookresearch/pifuhd)
- [Blender文档](https://docs.blender.org/)
- [ArmorPaint](https://github.com/armory3d/armorpaint)
- [Godot教程](https://docs.godotengine.org/)
