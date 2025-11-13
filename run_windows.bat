@echo off
REM Excel Auto Copy Tool - 직접 실행 (빌드 없이)

echo =====================================
echo Excel Auto Copy Tool - Quick Run
echo =====================================
echo.

REM Python 설치 확인
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python이 설치되어 있지 않습니다.
    echo https://www.python.org/downloads/ 에서 다운로드하세요.
    pause
    exit /b
)

echo [1/2] Installing dependencies...
pip install openpyxl

echo.
echo [2/2] Running program...
echo.
python excel_auto_copy.py

pause

