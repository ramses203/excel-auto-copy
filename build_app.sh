#!/bin/bash
# Excel Auto Copy Tool 빌드 스크립트

# 스크립트 위치로 이동
cd "$(dirname "$0")"

echo "====================================="
echo "Excel Auto Copy Tool Build Script"
echo "====================================="
echo ""
echo "Working directory: $(pwd)"
echo ""

# 가상환경 생성
echo "[1/5] Creating virtual environment..."
python3 -m venv venv

# 가상환경 활성화
echo "[2/5] Activating virtual environment..."
source venv/bin/activate

# 의존성 설치
echo "[3/5] Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller

# 실행 파일 빌드
echo "[4/5] Building executable..."
pyinstaller --onefile \
    --windowed \
    --name "ExcelAutoCopy" \
    --add-data "README.md:." \
    excel_auto_copy.py

# 정리
echo "[5/5] Cleaning up..."
rm -rf build
rm -rf __pycache__
rm -rf *.spec

echo ""
echo "====================================="
echo "Build completed!"
echo "====================================="
echo ""
echo "실행 파일 위치: dist/ExcelAutoCopy"
echo ""
echo "실행 방법:"
echo "  cd dist"
echo "  ./ExcelAutoCopy"
echo ""

