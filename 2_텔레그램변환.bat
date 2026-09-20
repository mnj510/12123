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
echo  텔레그램 내보내기 파일(result.json)을 md 로 바꿉니다.
echo  이 창에 result.json 을 끌어다 놓고 엔터를 치세요.
echo  (텔레그램 데스크톱 - 방 - 점 세 개 - Export chat history - JSON)
echo.
set /p J=  result.json 경로: 
set J=%J:"=%
if not exist "%J%" ( echo  파일이 없습니다: %J% & pause & exit /b 1 )
%PY% -X utf8 "도구\텔레그램변환.py" "%J%" "01_RAW\텔레그램\텔레그램.md"
echo.
echo  끝. 01_RAW\텔레그램\텔레그램.md 를 열어보세요.
pause
