@echo off
dir /w C:\Users
set /p id="Type the folder that looks most like your username: "

BatchSubstitute.bat "USERNAME" %id% C:\Users\%id%\Documents\GitHub\WSB-autosetup\