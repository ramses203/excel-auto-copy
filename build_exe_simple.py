#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
PyInstaller 설정 파일 (Windows EXE용)
macOS에서도 실행 가능
"""

import PyInstaller.__main__
import os

# 현재 디렉토리
current_dir = os.path.dirname(os.path.abspath(__file__))
script_path = os.path.join(current_dir, 'excel_auto_copy.py')
readme_path = os.path.join(current_dir, 'README.md')

# PyInstaller 실행
PyInstaller.__main__.run([
    script_path,
    '--onefile',               # 단일 실행 파일
    '--windowed',              # 콘솔 창 숨김 (GUI만)
    '--name=ExcelAutoCopy',    # 파일명
    f'--add-data={readme_path}{os.pathsep}.',  # README 포함
    '--clean',                 # 빌드 전 정리
    '--noconfirm',            # 확인 없이 덮어쓰기
])

print("\n" + "="*50)
print("빌드 완료!")
print("="*50)
print(f"\n실행 파일 위치: {os.path.join(current_dir, 'dist')}")
print("\nWindows: ExcelAutoCopy.exe")
print("macOS: ExcelAutoCopy")
print("\n" + "="*50)

