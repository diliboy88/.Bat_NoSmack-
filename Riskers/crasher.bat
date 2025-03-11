@echo off
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
