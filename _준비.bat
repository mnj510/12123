@echo off
setlocal
cd /d "%~dp0"
set PY=
py -3 -c "print()" >nul 2>&1 && set PY=py -3
if "%PY%"=="" ( python -c "print()" >nul 2>&1 && set PY=python )
if "%PY%"=="" (
  echo.
  echo  [!] 파이썬이 없습니다. https://www.python.org/downloads/ 에서 설치하세요.
  echo      설치 첫 화면에서 "Add python.exe to PATH" 를 꼭 체크하세요.
  echo.
  pause & exit /b 1
)
echo  파이썬 확인: %PY%
echo  필요한 부품을 설치합니다 (한 번만 하면 됩니다)...
%PY% -m pip install --quiet --upgrade pip
%PY% -m pip install --quiet requests beautifulsoup4 markdownify pillow
if errorlevel 1 ( echo. & echo  [!] 설치에 실패했습니다. 인터넷 연결을 확인하세요. & pause & exit /b 1 )
echo.
echo  준비 완료. 이제 1_블로그수집 / 2_텔레그램변환 / 3_책만들기 를 쓸 수 있습니다.
echo.
pause
