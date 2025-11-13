#!/bin/bash
# Cross-Platform Build Script
# macOS와 Windows 양쪽 빌드 지원

cd "$(dirname "$0")"

echo "====================================="
echo "Excel Auto Copy - Cross Platform Builder"
echo "====================================="
echo ""

# OS 감지
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLATFORM="macOS"
    EXE_NAME="ExcelAutoCopy"
    SEPARATOR=":"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    PLATFORM="Windows"
    EXE_NAME="ExcelAutoCopy.exe"
    SEPARATOR=";"
else
    PLATFORM="Linux"
    EXE_NAME="ExcelAutoCopy"
    SEPARATOR=":"
fi

echo "Detected Platform: $PLATFORM"
echo ""

# 가상환경 생성
echo "[1/5] Creating virtual environment..."
python3 -m venv venv 2>/dev/null || python -m venv venv

# 가상환경 활성화
echo "[2/5] Activating virtual environment..."
if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
else
    echo "Error: Could not find virtual environment activation script"
    exit 1
fi

# 의존성 설치
echo "[3/5] Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller

# UPX 설치 확인 (선택사항)
echo ""
echo "Checking for UPX (for smaller executable)..."
if command -v upx &> /dev/null; then
    echo "✓ UPX found - will use compression"
    USE_UPX="--upx-dir=$(which upx | xargs dirname)"
else
    echo "✗ UPX not found - skipping compression"
    echo "  Install: brew install upx (macOS) or download from https://upx.github.io/"
    USE_UPX=""
fi

# 실행 파일 빌드
echo ""
echo "[4/5] Building executable for $PLATFORM..."
echo "Using spec file: ExcelAutoCopy.spec"

if [ -f "ExcelAutoCopy.spec" ]; then
    pyinstaller ExcelAutoCopy.spec --clean --noconfirm $USE_UPX
else
    pyinstaller --onefile \
        --windowed \
        --name "ExcelAutoCopy" \
        --add-data "README.md${SEPARATOR}." \
        --hidden-import openpyxl \
        --hidden-import openpyxl.cell._writer \
        $USE_UPX \
        excel_auto_copy.py
fi

# 빌드 결과 확인
if [ -f "dist/$EXE_NAME" ] || [ -d "dist/ExcelAutoCopy.app" ]; then
    echo ""
    echo "✓ Build successful!"
    
    # 파일 크기 확인
    if [ -f "dist/$EXE_NAME" ]; then
        SIZE=$(du -h "dist/$EXE_NAME" | cut -f1)
        echo "  File: dist/$EXE_NAME"
        echo "  Size: $SIZE"
    fi
    
    if [ -d "dist/ExcelAutoCopy.app" ]; then
        SIZE=$(du -sh "dist/ExcelAutoCopy.app" | cut -f1)
        echo "  App: dist/ExcelAutoCopy.app"
        echo "  Size: $SIZE"
    fi
else
    echo ""
    echo "✗ Build failed!"
    exit 1
fi

# 정리
echo ""
echo "[5/5] Cleaning up..."
rm -rf build
rm -rf __pycache__

echo ""
echo "====================================="
echo "Build completed for $PLATFORM!"
echo "====================================="
echo ""

if [[ "$PLATFORM" == "macOS" ]]; then
    echo "실행 방법:"
    echo "  open dist/ExcelAutoCopy.app"
    echo "  또는 dist/$EXE_NAME"
elif [[ "$PLATFORM" == "Windows" ]]; then
    echo "실행 방법:"
    echo "  dist\\$EXE_NAME"
else
    echo "실행 방법:"
    echo "  dist/$EXE_NAME"
fi

echo ""
echo "배포할 파일:"
if [[ "$PLATFORM" == "macOS" ]]; then
    echo "  - dist/ExcelAutoCopy.app (더블클릭 실행)"
    echo "  - dist/$EXE_NAME (터미널 실행)"
else
    echo "  - dist/$EXE_NAME"
fi

echo ""

