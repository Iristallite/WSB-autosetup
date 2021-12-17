@echo off
dir /w C:\Users
set /p id="Type the folder that looks most like your username: "

echo `<HostFolder>C:\Users\%id%\Documents\GitHub\WSB-autosetup</HostFolder>\n   <SandboxFolder>C:\WSB-autosetup</SandboxFolder>\n   <ReadOnly>True</ReadOnly>\n  </MappedFolder>\n </MappedFolders>\n <LogonCommand>\n  <Command>C:\WSB-autosetup\Install.bat</Command>\n </LogonCommand>\n</Configuration>` >> C:\Users\%id%\Documents\GitHub\WSB-autosetup\6GB\test.wsb