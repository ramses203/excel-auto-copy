# Windows에서 실행하는 방법 (간단 버전)

## ⚠️ 현재 문제

macOS에서 만든 실행 파일은 Windows에서 실행되지 않습니다!
Windows에서는 다시 빌드하거나 Python으로 직접 실행해야 합니다.

---

## 🎯 방법 1: Python으로 바로 실행 (가장 쉬움!) ⭐️

### 준비물
- Windows PC
- Python 3.7 이상

### 실행 단계

**1. Python 설치 확인**
```cmd
python --version
```

없다면: https://www.python.org/downloads/ 에서 설치
- "Add Python to PATH" 체크 필수!

**2. 필요한 파일 복사**

Windows PC로 복사할 파일:
```
excel_auto_copy.py
requirements.txt
run_windows.bat       ← 새로 만든 파일!
README.md
```

**3. 실행**

`run_windows.bat` 더블클릭!

또는 명령 프롬프트에서:
```cmd
run_windows.bat
```

끝! 프로그램이 바로 실행됩니다! 🎉

---

## 🎯 방법 2: EXE 파일 만들기

완전한 설치 파일을 원한다면:

**1. 파일 복사**
```
excel_auto_copy.py
requirements.txt
build_windows.bat
README.md
```

**2. 빌드 실행**

`build_windows.bat` 더블클릭

**3. 결과**
```
dist\ExcelAutoCopy.exe  ← 생성됨!
```

**4. 실행**

`ExcelAutoCopy.exe` 더블클릭

---

## 🔧 수동 실행 (고급)

### 방법 A: 패키지 설치 후 실행

```cmd
# 1. openpyxl 설치
pip install openpyxl

# 2. 프로그램 실행
python excel_auto_copy.py
```

### 방법 B: 가상환경 사용

```cmd
# 1. 가상환경 생성
python -m venv venv

# 2. 가상환경 활성화
venv\Scripts\activate

# 3. 패키지 설치
pip install openpyxl

# 4. 프로그램 실행
python excel_auto_copy.py
```

---

## ❓ 에러 해결

### "Python을 찾을 수 없습니다"

**해결**:
1. https://www.python.org/downloads/ 에서 Python 설치
2. 설치 시 **"Add Python to PATH"** 체크!
3. 컴퓨터 재시작

### "'pip'은(는) 내부 또는 외부 명령..."

**해결**:
```cmd
python -m pip install openpyxl
```

### "ModuleNotFoundError: No module named 'openpyxl'"

**해결**:
```cmd
pip install openpyxl
```

또는:
```cmd
python -m pip install openpyxl
```

---

## 📦 권장 방법 비교

| 방법 | 장점 | 단점 | 추천도 |
|------|------|------|--------|
| run_windows.bat | 매우 쉬움, 빠름 | Python 필요 | ⭐⭐⭐⭐⭐ |
| EXE 빌드 | Python 불필요 | 시간 소요 | ⭐⭐⭐⭐ |
| 수동 실행 | 커스터마이징 가능 | 복잡함 | ⭐⭐⭐ |

---

## ✅ 최종 체크리스트

### 빠른 실행 (run_windows.bat)
- [ ] Python 설치됨
- [ ] 파일 복사됨 (excel_auto_copy.py, run_windows.bat)
- [ ] run_windows.bat 더블클릭
- [ ] 프로그램 실행됨! ✅

### EXE 빌드
- [ ] Python 설치됨
- [ ] 파일 복사됨
- [ ] build_windows.bat 실행
- [ ] dist\ExcelAutoCopy.exe 생성됨 ✅

---

## 🎁 보너스 팁

### 바탕화면에 바로가기 만들기

1. `run_windows.bat` 또는 `ExcelAutoCopy.exe` 마우스 오른쪽 클릭
2. "바로 가기 만들기"
3. 바탕화면으로 이동
4. 이름 변경: "엑셀 자동 복사"

이제 바탕화면에서 더블클릭으로 실행! 🎉

---

**요약**: Windows PC에 `run_windows.bat` 파일을 복사해서 더블클릭하세요!

