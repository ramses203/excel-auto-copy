# macOS에서 Windows EXE 만드는 모든 방법

## ❌ 직접 빌드는 불가능

**PyInstaller는 크로스 컴파일을 지원하지 않습니다.**
- macOS → macOS 실행 파일만
- Windows → Windows EXE만
- Linux → Linux 실행 파일만

---

## ✅ 가능한 방법들

### 방법 1: GitHub Actions (무료, 추천!) ⭐️⭐️⭐️⭐️⭐️

**장점**:
- 완전 무료
- macOS에서 작업 가능
- 자동화
- 온라인 백업

**단점**:
- GitHub 계정 필요
- 2-3분 대기
- 인터넷 필요

**사용법**:
1. GitHub 저장소 생성
2. 코드 푸시
3. Actions 탭에서 Run workflow
4. Artifacts에서 EXE 다운로드

**상세 가이드**: `GITHUB_ACTIONS_가이드.md` 참고

---

### 방법 2: 친구/동료 Windows PC 빌리기 ⭐️⭐️⭐️⭐️⭐️

**장점**:
- 가장 간단
- 즉시 가능
- 무료

**단점**:
- Windows PC 필요

**사용법**:
```bash
# 1. USB에 파일 복사
cp excel_auto_copy.py /Volumes/USB/
cp requirements.txt /Volumes/USB/
cp build_windows.bat /Volumes/USB/
cp README.md /Volumes/USB/

# 2. 친구 Windows PC에서
# build_windows.bat 더블클릭

# 3. dist\ExcelAutoCopy.exe 받기
```

---

### 방법 3: 가상머신 (Parallels/VMware) ⭐️⭐️⭐️⭐️

**장점**:
- macOS에서 완전히 해결
- 언제든 빌드 가능
- Windows 프로그램도 테스트 가능

**단점**:
- 유료 ($80-100/년)
- 디스크 공간 많이 사용 (50GB+)
- 느릴 수 있음

**사용법**:
1. Parallels Desktop 또는 VMware Fusion 설치
2. Windows 10/11 설치
3. 가상머신에서 `build_windows.bat` 실행
4. EXE 파일 macOS로 복사

**구매 링크**:
- Parallels: https://www.parallels.com/
- VMware Fusion: https://www.vmware.com/products/fusion.html
- VirtualBox (무료): https://www.virtualbox.org/

---

### 방법 4: 클라우드 VM (AWS/Azure) ⭐️⭐️⭐️

**장점**:
- 온라인에서 접근 가능
- 강력한 성능

**단점**:
- 유료 (시간당 과금)
- 설정 복잡
- 인터넷 필요

**사용법**:
1. AWS EC2 Windows 인스턴스 생성
2. RDP로 접속
3. Python 설치 및 빌드
4. EXE 다운로드

**예상 비용**: 시간당 $0.01-0.10

---

### 방법 5: Wine (비추천) ⭐️

**장점**:
- 무료
- macOS에서 가능

**단점**:
- 매우 복잡
- 잘 안 됨
- 시간 낭비

**사용법**:
```bash
# 설치
brew install wine-stable

# Windows Python 설치 (복잡함...)
# PyInstaller 설치 (더 복잡함...)
# 빌드 (아마 실패...)
```

**추천 안 함!**

---

## 📊 비교표

| 방법 | 난이도 | 비용 | 시간 | 품질 | 추천도 |
|------|--------|------|------|------|--------|
| GitHub Actions | 보통 | 무료 | 3분 | 완벽 | ⭐⭐⭐⭐⭐ |
| 친구 PC | 쉬움 | 무료 | 즉시 | 완벽 | ⭐⭐⭐⭐⭐ |
| 가상머신 | 보통 | 유료 | 즉시 | 완벽 | ⭐⭐⭐⭐ |
| 클라우드 VM | 어려움 | 유료 | 10분 | 완벽 | ⭐⭐⭐ |
| Wine | 어려움 | 무료 | 오래 | 불안정 | ⭐ |

---

## 🎯 상황별 추천

### 한 번만 만들면 됨
→ **친구 PC** 또는 **GitHub Actions**

### 자주 업데이트 예정
→ **GitHub Actions** (자동화)
→ **가상머신** (즉시성)

### 개인 프로젝트
→ **GitHub Actions** (무료)

### 회사 프로젝트
→ **가상머신** (보안)
→ **클라우드 VM** (팀 공유)

---

## 💡 제일 쉬운 방법 (추천 TOP 2)

### 1위: GitHub Actions ⭐️⭐️⭐️⭐️⭐️

```bash
# 5분이면 설정 완료!
cd /Users/johngreen/Dev/test
git init
git add .
git commit -m "Initial commit"

# GitHub에서 저장소 만들고
git remote add origin https://github.com/USERNAME/excel-auto-copy.git
git push -u origin main

# GitHub.com → Actions 탭 → Run workflow
# 3분 후 EXE 다운로드!
```

**파일 준비 완료**: `.github/workflows/build-windows.yml` ✅

### 2위: 친구/동료 Windows PC ⭐️⭐️⭐️⭐️⭐️

```bash
# 파일 4개만 전달
- excel_auto_copy.py
- requirements.txt
- build_windows.bat
- README.md

# 친구가 build_windows.bat 더블클릭
# 완료!
```

---

## 🚀 지금 바로 시작하기

### GitHub Actions 시작 (5분)

1. **GitHub 계정 만들기** (없다면)
   - https://github.com/join

2. **새 저장소 만들기**
   - https://github.com/new
   - 이름: `excel-auto-copy`

3. **코드 업로드**
   ```bash
   cd /Users/johngreen/Dev/test
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/excel-auto-copy.git
   git push -u origin main
   ```

4. **빌드 실행**
   - GitHub 저장소 → Actions 탭
   - "Build Windows EXE" → Run workflow

5. **EXE 다운로드**
   - 완료 후 Artifacts 섹션
   - `ExcelAutoCopy-Windows.zip` 다운로드

**완료! 🎉**

---

## 📝 결론

**직접 빌드는 불가능**하지만:
1. **GitHub Actions** (무료, 자동화) ← 추천!
2. **친구 PC** (가장 빠름)
3. **가상머신** (유료, 편리)

중에서 선택하시면 됩니다!

**추천**: GitHub Actions로 한 번 설정해두면 앞으로 계속 사용 가능! 🎯

