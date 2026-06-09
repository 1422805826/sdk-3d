# 完整安装指南

本文档涵盖所有SDK-3D相关工具的安装步骤。

## 系统要求

### 最低配置
- OS: Windows 10/11, macOS 10.15+, Ubuntu 20.04+
- RAM: 16GB (推荐32GB)
- GPU: NVIDIA (CUDA 11.8+) 或 AMD (HIP)
- 存储: 100GB 可用空间

### 推荐配置
- OS: Ubuntu 22.04 LTS
- RAM: 32GB
- GPU: NVIDIA RTX 3080 / 4080 (24GB VRAM)
- 存储: 500GB SSD

---

## 核心工具安装

### 1. Blender 4.x

```bash
# 从官网下载
wget https://www.blender.org/download/release/Blender4.1.1/

# 或从源码编译
git clone https://github.com/blender/blender.git
cd blender
git checkout blender-v4.1.1
make build
```

### 2. Python 3.10+

```bash
# Ubuntu
sudo apt update
sudo apt install python3.10 python3-pip

# macOS
brew install python@3.10

# 创建虚拟环境
python3.10 -m venv sdk3d_env
source sdk3d_env/bin/activate
```

### 3. PyTorch

```bash
# CUDA 11.8版本
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# CPU版本（仅用于测试）
pip install torch torchvision torchaudio
```

---

## 方案A: PIFuHD安装

```bash
cd schemes/scheme-a-pifuhd

# 克隆PIFuHD
git clone https://github.com/facebookresearch/pifuhd.git
cd pifuhd

# 安装依赖
pip install -r requirements.txt

# 下载预训练模型
sh ./scripts/download_trained_model.sh

# 返回方案目录
cd ..
```

---

## 方案B: 混合方案安装

```bash
cd schemes/scheme-b-hybrid

# 1. 安装PIFuHD
git clone https://github.com/facebookresearch/pifuhd.git
cd pifuhd && pip install -r requirements.txt
sh ./scripts/download_trained_model.sh
cd ..

# 2. 安装Champ
git clone https://github.com/fudan-generative-vision/champ.git
cd champ && pip install -r requirements.txt
cd ..
```

---

## 方案C: 全自动安装

```bash
cd schemes/scheme-c-auto

# 1. 安装LHM
git clone https://github.com/SKJWJ/LHM.git
cd LHM && pip install -r requirements.txt
cd ..

# 2. 安装Champ
git clone https://github.com/fudan-generative-vision/champ.git
cd champ && pip install -r requirements.txt
cd ..
```

---

## Godot 4.x 安装

```bash
# 下载Godot编辑器
wget https://downloads.tuxfamily.org/godotengine/4.2/Godot_v4.2-stable_linux.x86_64.zip
unzip Godot_v4.2-stable_linux.x86_64.zip

# 或从源码编译
git clone https://github.com/godotengine/godot.git
cd godot
git checkout 4.2-stable
scons platform=linuxtools=yes
```

---

## 验证安装

```bash
# 检查Blender
blender --version

# 检查Python
python --version

# 检查PyTorch
python -c "import torch; print(torch.cuda.is_available())"

# 检查Godot
godot --version
```

---

## 故障排除

### CUDA不可用
```bash
# 检查NVIDIA驱动
nvidia-smi

# 重新安装CUDA工具包
# https://developer.nvidia.com/cuda-downloads
```

### 内存不足
```bash
# 设置限制
export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb=512
```

### 权限错误
```bash
# 使用sudo或修改权限
sudo chmod +x setup.sh
./setup.sh
```
