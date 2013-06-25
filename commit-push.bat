@echo off
set /P message=Commit Message: 
git add .\Baumaterial.xlsx
git commit -m "%message%" >log.txt
echo. >>log.txt

if errorlevel 1 goto failcom

rem Scheint auch mit > zu gehn hab jetzt aber mal doch wieder >> benutzt damit der 2. kanal evtl angehängt wird an den ersten....
git push origin master >>log.txt 2>>&1

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
