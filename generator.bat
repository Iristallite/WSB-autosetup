@echo on
if %WSBGENPROG% gtr 0 goto Restart else goto Main

:Main
dir /w C:\Users
set /p WSBUSERNAME="Type the folder that corresponds to your username: "
echo Do you want vGPU ENABLE or DISABLE?
set /p WSBVGPU="vGPU: "
echo Do you want Networking ENABLE or DISABLE?
set /p WSBNET="Networking: "
echo How much RAM (in MB) do you want to allow the Sandbox to consume?
set /p WSBRAM="Maximum RAM in MB: "
if exist temp goto SetVar else mkdir temp
:SetVar
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=03>> generate.bat
echo generator.bat>> generate.bat
set WSBGENPROG=04
goto Restart
:Breakoff1
del generate.bat
echo @echo off>>generate.bat
echo set WSBGENPROG=03>> generate.bat
echo generator.bat>> generate.bat
BatchSubstitute.bat "WSBUSERNAME" %WSBUSERNAME% ungenerated.wsb >> temp\temp.wsb
:Breakoff2
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=02>> generate.bat
echo generator.bat>> generate.bat
BatchSubstitute.bat "WSBVGPU" %WSBVGPU% temp\temp.wsb >> temp\temp2.wsb
:Breakoff3
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=01>> generate.bat
echo generator.bat>> generate.bat
BatchSubstitute.bat "WSBNET" %WSBNET% temp\temp2.wsb >> temp\temp3.wsb
:Breakoff4
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=05>> generate.bat
echo generator.bat>> generate.bat
BatchSubstitute.bat "WSBRAM" %WSBRAM% temp\temp3.wsb >> temp\temp4.wsb
:CompleteCopy
copy temp\temp4.wsb .\
rmdir temp
del generate.bat
echo @echo off>> generate.bat
echo set WSBGENPROG=00>> generate.bat
echo generator.bat>> generate.bat
if %WSBVGPU%=ENABLE set FNVGPU=vGPU- else set FNVGPU=
if %WSBNET%=ENABLE set FNNET=Net- else set FNNET=
rename temp4.wsb "Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb"
set WSBFILENAME=Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb
:Finished
echo WSB file generated succesfully.
echo Filename: %WSBFILENAME%
pause
exit
:Restart
echo The script needs to restart %WSBGENPROG% more times to complete generating the WSB file.
echo After the script exits, run generate.bat to continue
pause
if %WSBGENPROG% equ 04 goto Breakoff1 else goto Check03
:Check03
if %WSBGENPROG% equ 03 goto Breakoff2 else goto Check02
:Check02
if %WSBGENPROG% equ 02 goto Breakoff3 else goto Check01
:Check01
if %WSBGENPROG% equ 01 goto Breakoff4 else goto Check05
:Check05
if %WSBGENPROG% equ 05 goto CompleteCopy else goto Error)

:Error
echo THE SCRIPT BROKE
echo (this will need manual troubleshooting...)
pause
exit