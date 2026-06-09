#!/bin/bash
# 方案C完整安装脚本

set -e

echo "========================================"
echo "SDK-3D 方案C (全自动) 安装脚本"
echo "========================================"

# 创建虚拟环境
echo "[1/3] 创建虚拟环境..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi
source venv/bin/activate

# 升级pip
echo "[2/3] 升级pip..."
pip install --upgrade pip setuptools wheel

# 安装基础依赖
echo "[3/3] 安装依赖..."
pip install -r requirements.txt

echo ""
echo "========================================"
echo "✅ 方案C安装完成！"
echo "========================================"
echo ""
echo "下一步:"
echo "1. 激活虚拟环境: source venv/bin/activate"
echo "2. 运行管道: python run_pipeline.py --image xxx.jpg"
echo ""
