# GitHub Actions로 Windows EXE 만들기 (macOS에서!)

## 🎯 목표
macOS에서 작업하지만 Windows용 `.exe` 파일을 자동으로 만들기

---

## 📝 준비 완료!

`.github/workflows/build-windows.yml` 파일이 생성되었습니다!

---

## 🚀 사용 방법

### 1단계: GitHub 저장소 만들기

GitHub.com에서:
1. 새 저장소 생성 (New repository)
2. 이름: `excel-auto-copy` (원하는 이름)
3. Public 또는 Private 선택
4. Create repository

### 2단계: 코드 업로드

터미널에서:

```bash
cd /Users/johngreen/Dev/test

# Git 초기화
git init

# 파일 추가
git add excel_auto_copy.py requirements.txt README.md .github/

# 커밋
git commit -m "Initial commit"

# GitHub 저장소 연결 (YOUR_USERNAME을 본인 이름으로)
git remote add origin https://github.com/YOUR_USERNAME/excel-auto-copy.git

# 업로드
git branch -M main
git push -u origin main
```

### 3단계: GitHub Actions 실행

GitHub 웹사이트에서:
1. 저장소 페이지로 이동
2. **Actions** 탭 클릭
3. "Build Windows EXE" 워크플로우 선택
4. **Run workflow** 클릭

### 4단계: EXE 다운로드

약 2-3분 후:
1. Actions 탭에서 완료된 워크플로우 클릭
2. 아래 **Artifacts** 섹션에서 `ExcelAutoCopy-Windows` 다운로드
3. ZIP 압축 해제
4. `ExcelAutoCopy.exe` 얻음! ✅

---

## 💡 자동 빌드

이제 코드를 수정하고 `git push`만 하면:
- 자동으로 Windows EXE가 빌드됩니다!
- Actions 탭에서 다운로드 가능!

---

## 🎁 보너스: Release 만들기

### 릴리즈로 배포하기

```bash
# 태그 생성
git tag v1.0.0
git push origin v1.0.0
```

GitHub에서:
1. **Releases** → **Create a new release**
2. Tag: v1.0.0 선택
3. Title: "Excel Auto Copy Tool v1.0.0"
4. Description: 사용 방법 작성
5. Actions에서 빌드된 EXE를 여기에 첨부
6. **Publish release**

이제 누구나 다운로드 가능! 🎉

---

## ⚠️ 주의사항

### Private 저장소
- GitHub 무료 계정도 Private에서 Actions 사용 가능
- 월 2,000분 무료 (충분함)

### Public 저장소
- 무제한 Actions 사용
- 누구나 코드 볼 수 있음

---

## 🔧 문제 해결

### Q: GitHub 계정이 없어요
A: https://github.com/join 에서 무료 가입

### Q: Git이 설치 안 되어 있어요
A: 
```bash
# macOS
brew install git

# 또는 Xcode Command Line Tools
xcode-select --install
```

### Q: Push가 안 돼요
A: Personal Access Token 필요
1. GitHub → Settings → Developer settings
2. Personal access tokens → Generate new token
3. repo 권한 체크
4. Token을 비밀번호 대신 사용

---

## ✅ 장단점

### 장점
- ✅ 완전 무료
- ✅ macOS에서 Windows EXE 생성
- ✅ 자동화됨
- ✅ 여러 버전 관리 가능
- ✅ 온라인 백업

### 단점
- ⚠️ GitHub 계정 필요
- ⚠️ 2-3분 빌드 시간
- ⚠️ 인터넷 연결 필요

---

## 📊 다른 방법들과 비교

| 방법 | 난이도 | 비용 | 시간 | 추천도 |
|------|--------|------|------|--------|
| GitHub Actions | 보통 | 무료 | 3분 | ⭐⭐⭐⭐⭐ |
| 가상머신 (Parallels) | 쉬움 | 유료 | 즉시 | ⭐⭐⭐⭐ |
| 친구 Windows PC | 매우 쉬움 | 무료 | 즉시 | ⭐⭐⭐⭐⭐ |
| Wine (크로스컴파일) | 어려움 | 무료 | 오래 걸림 | ⭐⭐ |

---

## 🎯 결론

### 추천 순서

1. **GitHub Actions** (이 방법!) ⭐️
   - 무료, 자동화, 전문적
   
2. **친구/동료 Windows PC**
   - USB로 파일 복사 → `build_windows.bat` 실행 → EXE 받기
   
3. **가상머신**
   - Parallels/VMware에 Windows 설치
   - 직접 빌드

---

## 🚀 빠른 시작

```bash
# 1. GitHub 저장소 만들기 (웹에서)

# 2. 코드 업로드
cd /Users/johngreen/Dev/test
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/excel-auto-copy.git
git push -u origin main

# 3. GitHub Actions 탭에서 Run workflow

# 4. 완료되면 Artifacts에서 EXE 다운로드!
```

**완료! 🎉**

