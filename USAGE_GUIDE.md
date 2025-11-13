# Excel Auto Copy Tool - 사용 가이드

## 🎯 목적

Source 엑셀 파일의 각 행을 Target 엑셀 파일에 지정한 횟수만큼 반복해서 자동으로 복사합니다.

**예시**: Source 727행 → Target 16,721행 (727 × 23회)

---

## 📦 설치된 파일

```
/Users/johngreen/Dev/test/
├── excel_auto_copy.py       # Python 소스 코드
├── requirements.txt          # Python 패키지 목록
├── build_app.sh             # 빌드 스크립트
├── README.md                # 프로젝트 설명
├── USAGE_GUIDE.md           # 이 파일
└── dist/
    ├── ExcelAutoCopy        # 실행 파일 (터미널용)
    └── ExcelAutoCopy.app    # 맥 앱 (더블클릭 실행)
```

---

## 🚀 실행 방법

### 방법 1: 앱 더블클릭 (가장 쉬움) ⭐️

```bash
/Users/johngreen/Dev/test/dist/ExcelAutoCopy.app
```

위 파일을 Finder에서 더블클릭하면 GUI 프로그램이 실행됩니다.

### 방법 2: 터미널에서 실행

```bash
cd /Users/johngreen/Dev/test/dist
./ExcelAutoCopy
```

---

## 📖 사용 방법

### 1단계: Source Excel 선택
- **Browse** 버튼 클릭
- 원본 데이터가 있는 엑셀 파일 선택
- 예: `source.xlsx` (727행 데이터)

### 2단계: Target Excel 선택
- **Browse** 버튼 클릭
- 데이터를 붙여넣을 엑셀 파일 선택
- 예: `target.xlsx` (비어있거나 기존 데이터 덮어쓰기)

### 3단계: 옵션 설정

#### Repeat Count (per row)
- 각 행을 몇 번 반복할지 설정
- 기본값: **23**
- 범위: 1 ~ 100

#### Source Start Row
- Source 파일에서 시작할 행 번호
- 기본값: **1** (첫 번째 행부터)
- 범위: 1 ~ 10,000

### 4단계: 실행
- **Start Copy** 버튼 클릭
- 진행률 바에서 실시간 진행 상황 확인
- 완료 시 팝업 메시지 표시

### 5단계: 중단 (선택사항)
- 작업 중 **Stop** 버튼으로 중단 가능
- 중단 시까지 작업한 내용은 저장되지 않음

---

## 💡 사용 예시

### 예시 1: 기본 사용 (727행 × 23회)

**입력:**
- Source: `data.xlsx` (1~727행)
- Target: `output.xlsx` (빈 파일)
- Repeat Count: 23
- Start Row: 1

**결과:**
- Row 1~23: data.xlsx의 1행 (23번 반복)
- Row 24~46: data.xlsx의 2행 (23번 반복)
- ...
- Row 16,698~16,721: data.xlsx의 727행 (23번 반복)
- **총 16,721행 생성**

### 예시 2: 중간부터 시작

**입력:**
- Source: `data.xlsx` (1~1000행)
- Target: `output.xlsx`
- Repeat Count: 10
- Start Row: 500

**결과:**
- 500~1000행만 처리 (501행)
- 총 5,010행 생성 (501 × 10)

---

## ⚠️ 주의 사항

### 1. 파일 선택
- ✅ Source와 Target은 **반드시 다른 파일**이어야 합니다
- ❌ 같은 파일 선택 시 오류 발생

### 2. 백업
- ⚠️ Target 파일은 **기존 데이터가 덮어쓰기** 됩니다
- 📁 중요한 파일은 **사전에 백업**하세요

### 3. 작업 시간
- 📊 대용량 파일 (10,000행 이상): 수 분 소요 가능
- 💻 작업 중 다른 프로그램 사용 가능
- 🛑 강제 종료하면 데이터 손실 가능

### 4. 파일 형식
- ✅ 지원: `.xlsx`, `.xls`
- ✅ 데이터, 스타일, 서식 모두 복사됨
- ✅ 수식은 값으로 변환되어 복사됨

---

## 🔧 문제 해결

### Q1: 프로그램이 실행되지 않아요

**macOS 보안 경고 발생 시:**

```bash
# 실행 권한 부여
chmod +x /Users/johngreen/Dev/test/dist/ExcelAutoCopy

# 보안 해제
xattr -cr /Users/johngreen/Dev/test/dist/ExcelAutoCopy.app
```

또는:
1. **시스템 환경설정** → **보안 및 개인 정보 보호**
2. "확인 없이 열기" 클릭

### Q2: "No module named 'openpyxl'" 오류

Python 직접 실행 시:

```bash
pip install openpyxl
```

실행 파일 사용 시는 이 오류가 발생하지 않습니다.

### Q3: 작업이 너무 느려요

**해결 방법:**
- 스타일 복사를 비활성화하려면 소스 코드 수정 필요
- `excel_auto_copy.py` 파일에서 스타일 복사 부분 주석 처리

### Q4: 특정 열만 복사하고 싶어요

현재 버전은 전체 행 복사만 지원합니다.
특정 열만 복사하려면 소스 코드 수정이 필요합니다.

---

## 🔄 재빌드 방법

소스 코드를 수정한 후 다시 빌드하려면:

```bash
cd /Users/johngreen/Dev/test
./build_app.sh
```

빌드 후 `dist/` 폴더에 새 실행 파일이 생성됩니다.

---

## 📝 기술 정보

### 사용 기술
- **Python 3.9+**
- **openpyxl**: 엑셀 파일 읽기/쓰기
- **tkinter**: GUI (맥 기본 제공)
- **PyInstaller**: 실행 파일 변환

### 기능
- ✅ 데이터 복사
- ✅ 스타일 복사 (폰트, 색상, 테두리, 채우기)
- ✅ 서식 복사 (숫자 형식, 정렬)
- ✅ 진행률 실시간 표시
- ✅ 중단 기능
- ✅ 멀티스레딩 (UI 응답성 유지)

### 성능
- **100행 × 23회**: ~5초
- **1,000행 × 23회**: ~30초
- **10,000행 × 23회**: ~5분
- **727행 × 23회 (16,721행)**: ~1분

*실제 시간은 엑셀 파일 복잡도에 따라 다름*

---

## 📞 문의

문제 발생 시:
1. 에러 메시지 스크린샷
2. Source/Target 파일 행 수
3. 설정한 옵션 값

위 정보를 포함하여 문의하세요.

---

**만든 날짜**: 2025-11-13  
**버전**: 1.0.0  
**라이선스**: MIT

