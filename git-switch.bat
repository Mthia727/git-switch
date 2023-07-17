@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

rem Define the list of username-email pairs
set "USER1="
set "EMAIL1="
set "KEY1="
set "KEY1S="
set "USER2="
set "EMAIL2="

rem Get the current username from Git global configuration
for /F "delims=" %%A in ('git config --global --get user.name') do (
    set "CURRENT_USER=%%A"
)

rem Switch between the usernames and emails
if "%CURRENT_USER%"=="%USER1%" (
    git config --global user.name "%USER2%"
    git config --global user.email "%EMAIL2%"
    git config --global --unset user.signingkey
    git config --global commit.gpgsign false
    echo Switched to %USER2%
) else (
    git config --global user.name "%USER1%"
    git config --global user.email "%EMAIL1%"
    git config --global user.signingkey "%KEY1%"
    git config --global user.signingkey "%KEY1S%"!
    git config --global commit.gpgsign true
    echo Switched to %USER1%
)

pause > nul

endlocal
