@echo off
dir /w C:\Users
set /p WSBUSERNAME="Type the folder that looks most like your username: "
echo Do you want vGPU ENABLE or DISABLE?
set /p WSBVGPU="vGPU: "
echo Do you want Networking ENABLE or DISABLE?
set /p WSBNET="Networking: "
echo How much RAM (in MB) do you want to allow the Sandbox to consume?
set /p WSBRAM="Maximum RAM in MB: "
mkdir temp
cmd BatchSubstitute.bat "WSBUSERNAME" %WSBUSERNAME% ungenerated.wsb >> temp\temp.wsb
cmd BatchSubstitute.bat "WSBVGPU" %WSBVGPU% temp\temp.wsb >> temp\temp2.wsb
cmd BatchSubstitute.bat "WSBNET" %WSBNET% temp\temp2.wsb >> temp\temp3.wsb
cmd BatchSubstitute.bat "WSBRAM" %WSBRAM% temp\temp3.wsb >> temp\temp4.wsb
copy temp\temp4.wsb .\
rmdir temp
if %WSBVGPU%=ENABLE set FNVGPU="vGPU-" else set FNVGPU=""
if %WSBNET%=ENABLE set FNNET="Net-" else set FNNET=""
rename temp4.wsb "Run-%FNVGPU%%FNNET%%WSBRAM%MB.wsb"

echo WSB file generated succesfully.
echo Filename: %WSBFILENAME%
pause
exit
