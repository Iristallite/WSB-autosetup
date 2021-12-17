@echo off
if %WSBGENPROG% gtr 00 (goto Restart) else (goto Main)

:Main
dir C:\Users
set /p WSBUSERNAME="Type the folder that corresponds to your username: "
echo Do you want vGPU enabled or disabled?
echo Type "Enable" or "Disable"
set /p WSBVGPU="vGPU: "
echo Do you want Networking enabled or disabled?
echo Type "Enable" or "Disable"
set /p WSBNET="Networking: "
echo How much RAM (in MB) do you want to allow the Sandbox to consume?
set /p WSBRAM="Maximum RAM in MB: "

:SetVar
call :regenerate-generate
echo generator.bat>> generate.bat
set WSBGENPROG=04
goto Restart

:Breakoff1
call :regenerate-generate
echo set WSBGENPROG=03>> generate.bat
echo generator.bat>> generate.bat
BatchSubstitute.bat "WSBUSERNAME" %WSBUSERNAME% ungenerated.wsb>temp\temp.wsb

:Breakoff2
call :regenerate-generate
echo set WSBGENPROG=02>> generate.bat
echo generator.bat>> generate.bat
cd temp
BatchSubstitute.bat "WSBVGPU" %WSBVGPU% temp.wsb>temp2.wsb

:Breakoff3
call :regenerate-generate
echo set WSBGENPROG=01>> generate.bat
echo generator.bat>> generate.bat
cd temp
BatchSubstitute.bat "WSBNET" %WSBNET% temp2.wsb>temp3.wsb

:Breakoff4
call :regenerate-generate
echo set WSBGENPROG=05>> generate.bat
echo generator.bat>> generate.bat
cd temp
BatchSubstitute.bat "WSBRAM" %WSBRAM% temp3.wsb>temp4.wsb

:CompleteCopy
copy temp\temp4.wsb .\
del /f temp\*.wsb
call :clean-generate
cls
if %WSBVGPU% equ Enable (set FNVGPU=vGPU-) else (set FNVGPU=)
if %WSBNET% equ Enable (set FNNET=Net-) else (set FNNET=)
rename temp4.wsb "Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb"
set WSBFILENAME=Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb

:Finished
echo WSB file generated succesfully.
echo Filename: %WSBFILENAME%
pause
exit

:Restart
cls
call :Check05
call :CheckPlural
call :RestartCount
echo The script needs to restart %RESTARTCOUNT% more %PLURAL% to complete generating the WSB file.
echo After the script exits, run generate.bat again to continue.
pause
if %WSBGENPROG% equ 04 (goto Breakoff1) else (if %WSBGENPROG% equ 03 (goto Breakoff2) else (if %WSBGENPROG% equ 02 (goto Breakoff3) else (if %WSBGENPROG% equ 01 (goto Breakoff4) else (goto Error))))

:Check05
if %WSBGENPROG% equ 05 (goto CompleteCopy) else (exit /b)
exit /b

:CheckPlural
if %WSBGENPROG% equ 01 (set PLURAL=time) else (set PLURAL=times)
exit /b

:RestartCount
if %WSBGENPROG% equ 04 (set RESTARTCOUNT=4) else (if %WSBGENPROG% equ 03 (set RESTARTCOUNT=3) else (if %WSBGENPROG% equ 02 (set RESTARTCOUNT=2) else (if %WSBGENPROG% equ 01 (set RESTARTCOUNT=1) else (goto Error))))
exit /b

:Error
echo THE SCRIPT BROKE
echo (this will need manual troubleshooting...)
pause
exit

:regenerate-generate
del generate.bat
echo @echo off>> generate.bat
echo set WSBUSERNAME=%WSBUSERNAME%>> generate.bat
echo set WSBVGPU=%WSBVGPU%>> generate.bat
echo set WSBNET=%WSBNET%>> generate.bat
echo set WSBRAM=%WSBRAM%>> generate.bat
exit /b

:clean-generate
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=00>> generate.bat
echo generator.bat>> generate.bat
exit /b