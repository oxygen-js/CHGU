@echo off
if "%OS%" == not "Windows_NT" goto quick_install_win9x
chcp 437

title Install/Uninstall ZMBV movie codec
set errornum=0
setlocal enableextensions
cd /d "%~dp0"
:ready
if not exist %SystemRoot%\system32\rundll32.exe set errornum=1 && goto error
if not exist .\zmbv\zmbv.dll set errornum=2 && goto error
if not exist .\zmbv\zmbv.inf set errornum=3 && goto error
if /I "%1" == "/u" goto uninstall_confirm
if exist %SystemRoot%\inf\zmbv.inf goto already_installed
:install_confirm
set me=
cls
set /p me=Do you want to install ZMBV codec [Y/N]?
if /I "%me%" == "y" goto install
if /I "%me%" == "n" goto done
goto install_confirm
:install
echo.
%SystemRoot%\system32\rundll32.exe setupapi,InstallHinfSection DefaultInstall 128 .\zmbv\zmbv.inf
if exist %SystemRoot%\inf\zmbv.inf (echo Zip Motion Block Video codec installation is complete.) ELSE (echo Failed to install.)
pause >nul
goto done

:uninstall_confirm
set me=
cls
echo Are you sure to uninstall ZMBV codec [Y/N]?
if /I "%me%" == "y" goto uninstall
if /I "%me%" == "n" goto done
:uninstall
echo.
%SystemRoot%\system32\rundll32.exe setupapi,InstallHinfSection DefaultunInstall 128 .\zmbv\zmbv.inf
if not exist %SystemRoot%\inf\zmbv.inf (echo Zip Motion Block Video codec uninstallation is complete.) ELSE (echo Failed to uninstall.)
pause >nul
goto done

:already_installed
set me=
cls
echo Already installed. Select one of the following options.
set /p me=Reinstall: R, Uninstall: U, Quit: Q   [R/U/Q]?
if /I "%me%" == "r" goto install
if /I "%me%" == "u" goto uninstall
if /I "%me%" == "q" goto done
goto already_installed

:error
if %errornum% == 0 goto done
echo Error!
if %errornum% == 1 echo Couldn't find rundll32.exe in your systemroot.
if %errornum% == 2 echo Couldn't find zmbv.dll in \zmbv.
if %errornum% == 3 echo Couldn't find zmbv.inf in \zmbv.
pause >nul
goto done

:quick_install_win9x
if not exist .\zmbv\zmbv.dll set errornum=2 && goto error
if not exist .\zmbv\zmbv.inf set errornum=3 && goto error
rundll setupx.dll,InstallHinfSection DefaultInstall 128 $INSTDIR\Video Codec\zmbv.inf
goto done

:done
set errornum=
set me=
