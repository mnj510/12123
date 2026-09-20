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
echo.
echo  원고.txt 로 전자책(index.html)을 만듭니다.
echo.
%PY% -X utf8 "도구\책만들기.py"
if errorlevel 1 ( echo. & pause & exit /b 1 )
echo.
echo  index.html 을 더블클릭하면 책이 열립니다. 폰으로 보내도 그대로 열립니다.
echo.
start "" "index.html"
pause
