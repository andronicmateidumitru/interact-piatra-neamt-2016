@echo off
cd /d %~dp0

echo =========================
echo   AUTO GIT UPDATE
echo =========================

REM Data + ora
set dateTime=%date% %time%
set dateTime=%dateTime:/=-%
set dateTime=%dateTime::=-%

REM Verifică modificări
git status --porcelain > temp_git_check.txt

for /f %%i in (temp_git_check.txt) do set changes=1
del temp_git_check.txt

if not defined changes (
    echo.
    echo Nu exista modificari de trimis.
    pause
    exit
)

echo.
echo Modificari gasite. Se face commit...

git add .

git commit -m "Auto update - %dateTime%"

git push

echo.
echo GATA! Totul a fost trimis.
pause
