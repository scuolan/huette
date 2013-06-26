@echo off
set /P message=Commit Message: 
git add .\Baumaterial.xlsx
git add .\commit-push.bat
git commit -m "%message%" >log.txt
echo. >>log.txt

if errorlevel 1 goto failcom

git push origin master 2>>log.txt >>&2

if errorlevel 1 goto failpush

echo.  
echo Commit und Push ERFOLGREICH!
goto end

:failcom
echo.
echo Commit FAIL! see log.txt for details
goto end

:failpush
echo.
echo Push FAIL! see log.txt for details

:end
pause >nul
