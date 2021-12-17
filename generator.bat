@echo off
if %1% geq 1 goto Restart else if %1%=start goto Main else goto Error
:Main
dir /w C:\Users
set /p WSBUSERNAME="Type the folder that looks most like your username: "
echo Do you want vGPU ENABLE or DISABLE?
set /p WSBVGPU="vGPU: "
echo Do you want Networking ENABLE or DISABLE?
set /p WSBNET="Networking: "
echo How much RAM (in MB) do you want to allow the Sandbox to consume?
set /p WSBRAM="Maximum RAM in MB: "
if exist temp rmdir temp temp else mkdir temp 
:: Separator
:Breakoff1
echo generator.bat 4 > generate.bat
BatchSubstitute.bat "WSBUSERNAME" %WSBUSERNAME% ungenerated.wsb >> temp\temp.wsb
:Breakoff2
echo generator.bat 3 > generate.bat
BatchSubstitute.bat "WSBVGPU" %WSBVGPU% temp\temp.wsb >> temp\temp2.wsb
:Breakoff3
echo generator.bat 2 > generate.bat
BatchSubstitute.bat "WSBNET" %WSBNET% temp\temp2.wsb >> temp\temp3.wsb
:Breakoff4
echo generator.bat 1 > generate.bat
BatchSubstitute.bat "WSBRAM" %WSBRAM% temp\temp3.wsb >> temp\temp4.wsb
:CompleteCopy
copy temp\temp4.wsb .\
rmdir temp
del generate.bat
echo @echo off > generate.bat
echo generator.bat start > generate.bat
if %WSBVGPU%=ENABLE set FNVGPU="vGPU-" else set FNVGPU=""
if %WSBNET%=ENABLE set FNNET="Net-" else set FNNET=""
rename temp4.wsb "Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb"
set WSBFILENAME="Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb"
:Finished
echo WSB file generated succesfully.
echo Filename: %WSBFILENAME%
pause
exit
:Restart
del generate.bat
echo @echo off > generate.bat
echo The script needs to restart %1% more times to complete generating the WSB file.
echo After the script exits, run generate.bat to continue
pause
if %1%=3 goto Breakoff2 else if %1%=2 goto Breakoff3 else if %1%=1 goto Breakoff4 else if %1%=done goto CompleteCopy else goto errorlevel

:Error
echo THE SCRIPT BROKE
echo (this will need manual troubleshooting...)
pause
exit