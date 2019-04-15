@echo off
title I N I T I A L I S I N G . . .
REM (c)2019 Franco Pozzebon
REM This program is distrubuted free of charge

REM IPV4 ADDRESS GRAB
FOR /F "delims=: tokens=2" %%a in ('ipconfig ^| find "IPv4"') do set _localadd=%%a

rem VARIABLES
set savefilepath=
set serverfilepath=
set whitelistpath= 
set servername=
set serverfileenable=1
set whitelistenable=1

:MMENU
set serverfilepathdisp=%serverfilepath%
set whitelistpathdisp=%whitelistpath%

IF %serverfileenable%==2 set serverfilepathdisp=Server JSON Not Enabled
IF %serverfileenable%==2 set serverfile= 
IF %serverfileenable%==2 set serverfilepath= 

IF %whitelistenable%==2 set whitelistpathdisp=Whitelist Not Enabled
IF %whitelistenable%==2 set whitelist= 
IF %whitelistenable%==2 set whitelistpath= 

rem MAIN MENU
title %servername% - Not Running
cls
echo ---------------------  Slayer's Dedicated Server Program  ---------------------
echo ------------------                VERSION 1.2                ------------------
echo.
echo SAVE FILE
echo "%savefilepath%"
echo.
echo SERVER FILE
echo "%serverfilepathdisp%"
echo.
echo WHITELIST
echo "%whitelistpathdisp%"
echo.
echo LOCAL IP ADDRESS - %_localadd%:34197
echo ............................
echo 1 - Start Server
echo 2 - Change Save File path
echo 3 - Change Settings JSON path
echo 4 - Change Whitelist path
echo.
SET /P menu=Input Option: 
IF %menu%==1 GOTO server
IF %menu%==2 GOTO sf
IF %menu%==3 GOTO sj
IF %menu%==4 GOTO cw

rem SERVER OPERATIONS
pause
:server
title %servername% - Running
cls
factorio.exe --start-server %savefilepath% %serverfile% %serverfilepath% %whitelist% %whitelistpath%
cls
title %servername% - Not Running
cls
echo The server has shut down.
echo Press any key to return to the main menu
pause >nul
goto MMENU

rem SAVE FILE OPERATIONS
:sf
cls
title %servername% - Changing Save File Path
echo Current Save File path is:
echo "%savefilepath%"
SET /p savefilepath=Input Save File Path: 
echo Save File path has now been set.
timeout 1
GOTO MMENU

rem SERVER JSON OPERATIONS
:sj
cls
title %servername% - Changing Server File Settings
echo Enable Server File?
echo -----------------
echo 1 - Yes
echo 2 - No
echo -----------------
set /p serverfileenable=Input Option: 
IF %serverfileenable%==1 GOTO sje
IF %serverfileenable%==2 GOTO sjd

rem SERVER FILE ENABLED
:sje
cls
set serverfile=--server-settings
echo Current Server Settings JSON path is:
echo "%serverfilepath%"
SET /p serverfilepath=Input Server JSON Path 
echo Server JSON path has now been set.
timeout 1
GOTO MMENU

rem SERVER FILE DISABLED
:sjd
cls
echo Server File Disbaled.
set serverfilepath= 
set serverfile= 
timeout 1
GOTO MMENU

rem WHITELIST SETTINGS
:cw
cls
title %servername% - Changing Whitelist Settings
echo Enable whitelist?
echo -----------------
echo 1 - Yes
echo 2 - No
echo -----------------
set /p whitelistenable=Input Option: 
IF %whitelistenable%==1 GOTO wp
IF %whitelistenable%==2 GOTO wd

rem WHITELIST ENABLED
:wp
cls
set whitelist=--whitelist
echo Current Whitelist path is:
echo "%whitelistpath%"
SET /p whitelistpath=Input Whitelist Path
echo Whitelist path has now been set.
timeout 1
GOTO MMENU

rem WHITELIST DISABLED
:wd
cls
echo Whitelist Disabled.
set whitelistpath= 
set whitelist= 
timeout 1
GOTO MMENU