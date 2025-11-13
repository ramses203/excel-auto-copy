@echo off
REM Excel Auto Copy Tool - Windows Build Script
REM Windows에서 실행하세요

echo =====================================
echo Excel Auto Copy Tool Build Script
echo Windows EXE Builder
echo =====================================
echo.

REM 가상환경 생성
echo [1/5] Creating virtual environment...
python -m venv venv

REM 가상환경 활성화
echo [2/5] Activating virtual environment...
call venv\Scripts\activate.bat

REM 의존성 설치
echo [3/5] Installing dependencies...
python -m pip install --upgrade pip
pip install -r requirements.txt
pip install pyinstaller

REM 실행 파일 빌드
echo [4/5] Building Windows EXE...
pyinstaller --onefile ^
    --windowed ^
    --name "ExcelAutoCopy" ^
    --add-data "README.md;." ^
    excel_auto_copy.py

REM 정리
echo [5/5] Cleaning up...
rmdir /s /q build
rmdir /s /q __pycache__
del /q *.spec

echo.
echo =====================================
echo Build completed!
echo =====================================
echo.
echo 실행 파일 위치: dist\ExcelAutoCopy.exe
echo.
echo 실행 방법:
echo   cd dist
echo   ExcelAutoCopy.exe
echo.

pause

