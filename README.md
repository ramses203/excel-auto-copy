# Excel Auto Copy Tool

엑셀 파일의 각 행을 다른 엑셀 파일에 반복해서 복사하는 자동화 도구입니다.

## 기능

- **Source Excel**: 원본 데이터가 있는 엑셀 파일 (예: 727행)
- **Target Excel**: 데이터를 붙여넣을 엑셀 파일
- **자동 반복**: Source의 각 행을 Target에 1~23번 반복해서 붙여넣기
- **결과**: Source 727행 × 23회 = Target 16,721행 자동 생성

## 사용 예시

```
Source Excel (1.xlsx):
Row 1: 데이터1-1
Row 2: 데이터1-2
...
Row 727: 데이터1-727

↓ 자동 복사 (23회 반복)

Target Excel (2.xlsx):
Row 1~23: 데이터1-1 (23번 반복)
Row 24~46: 데이터1-2 (23번 반복)
...
Row 16,698~16,721: 데이터1-727 (23번 반복)
```

## 설치 및 실행

### 방법 1: 실행 파일 사용 (권장)

1. 빌드 스크립트 실행:
```bash
chmod +x build_app.sh
./build_app.sh
```

2. 실행 파일 실행:
```bash
cd dist
./ExcelAutoCopy
```

### 방법 2: Python 스크립트 직접 실행

1. 의존성 설치:
```bash
pip install -r requirements.txt
```

2. 프로그램 실행:
```bash
python3 excel_auto_copy.py
```

## 사용 방법

1. **Source Excel 선택**: 원본 데이터가 있는 엑셀 파일 선택
2. **Target Excel 선택**: 데이터를 붙여넣을 엑셀 파일 선택
3. **옵션 설정**:
   - Repeat Count: 각 행을 몇 번 반복할지 설정 (기본값: 23)
   - Source Start Row: Source 파일에서 시작할 행 번호 (기본값: 1)
4. **Start Copy 버튼 클릭**: 자동 복사 시작
5. **진행 상황 확인**: 진행률 바에서 실시간 확인
6. **완료**: 작업 완료 후 Target 파일에 저장됨

## 주의 사항

- Source와 Target 파일은 반드시 다른 파일이어야 합니다
- Target 파일은 작업 중 덮어쓰기 됩니다 (백업 권장)
- 대용량 파일의 경우 시간이 오래 걸릴 수 있습니다
- 작업 중 프로그램을 강제 종료하면 데이터가 손실될 수 있습니다

## 시스템 요구사항

- macOS / Windows / Linux
- Python 3.7 이상 (스크립트 실행 시)
- 충분한 메모리 (엑셀 파일 크기에 따라 다름)

## 문제 해결

### "No module named 'openpyxl'" 오류
```bash
pip install openpyxl
```

### 실행 파일이 실행되지 않을 때
```bash
chmod +x dist/ExcelAutoCopy
```

### 빌드가 실패할 때
```bash
pip install --upgrade pyinstaller
```

## 라이선스

MIT License

## 개발자

John Green

