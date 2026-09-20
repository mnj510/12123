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
echo  네이버 블로그 글을 01_RAW\블로그\ 에 md 파일로 모읍니다.
echo  블로그 주소가 blog.naver.com/abc123 이면 아이디는 abc123 입니다.
echo.
set /p BID=  블로그 아이디: 
if "%BID%"=="" ( echo  아이디가 비었습니다. & pause & exit /b 1 )
set /p LIM=  몇 개까지? (전부면 그냥 엔터): 
set OPT=
if not "%LIM%"=="" set OPT=--limit %LIM%
%PY% -X utf8 "도구\블로그수집.py" %BID% "01_RAW\블로그\%BID%" %OPT%
echo.
echo  끝. 01_RAW\블로그\%BID%\ 를 열어보세요.
pause
