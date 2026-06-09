#!/bin/bash
# 方案B完整安装脚本

set -e

echo "========================================"
echo "SDK-3D 方案B (混合方案) 安装脚本"
echo "========================================"

# 创建虚拟环境
echo "[1/4] 创建虚拟环境..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# 升级pip
echo "[2/4] 升级pip..."
pip install --upgrade pip setuptools wheel

# 安装基础依赖
echo "[3/4] 安装依赖..."
pip install -r requirements.txt

# 下载预训练模型
echo "[4/4] 下载预训练模型..."
if [ ! -d "pifuhd" ]; then
    git clone https://github.com/facebookresearch/pifuhd.git
    cd pifuhd
    sh ./scripts/download_trained_model.sh
    cd ..
fi

if [ ! -d "champ" ]; then
    git clone https://github.com/fudan-generative-vision/champ.git
    cd champ
    pip install -r requirements.txt
    cd ..
fi

echo ""
echo "========================================"
echo "✅ 方案B安装完成！"
echo "========================================"
echo ""
echo "下一步:"
echo "1. 激活虚拟环境: source venv/bin/activate"
echo "2. 运行管道: python run_pipeline.py --image xxx.jpg --video xxx.mp4"
echo ""
