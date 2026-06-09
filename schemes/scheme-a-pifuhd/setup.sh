#!/bin/bash
# 方案A完整安装脚本

set -e

echo "========================================"
echo "SDK-3D 方案A (PIFuHD) 安装脚本"
echo "========================================"

# 检查Python版本
echo "[1/5] 检查Python版本..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
echo "Python版本: $python_version"

# 创建虚拟环境
echo "[2/5] 创建虚拟环境..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# 升级pip
echo "[3/5] 升级pip..."
pip install --upgrade pip setuptools wheel

# 安装基础依赖
echo "[4/5] 安装依赖..."
pip install -r requirements.txt

# 下载PIFuHD模型（如果不存在）
echo "[5/5] 检查预训练模型..."
if [ ! -f "pifuhd/checkpoints/pifuhd.pt" ]; then
    echo "下载PIFuHD预训练模型..."
    cd pifuhd
    sh ./scripts/download_trained_model.sh
    cd ..
fi

echo ""
echo "========================================"
echo "✅ 方案A安装完成！"
echo "========================================"
echo ""
echo "下一步:"
echo "1. 激活虚拟环境: source venv/bin/activate"
echo "2. 运行管道: python run_pipeline.py --image path/to/image.jpg"
echo ""
