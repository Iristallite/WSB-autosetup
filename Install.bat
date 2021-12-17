C:\WSB-autosetup\vbs\cpp.vbs
:: Extract cpp folder
C:\WSB-autosetup\cpp.exe -y -o"C:\cpp"
:: Run VC++ x86 installers
C:\cpp\2010x86.exe /norestart /passive
C:\cpp\2012x86.exe /install /passive /norestart
C:\cpp\2013x86.exe /install /passive /norestart
C:\cpp\20152022x86.exe /install /passive /norestart

:: Run VC++ x64 installers
C:\cpp\2010x64.exe /norestart /passive
C:\cpp\2012x64.exe /install /passive /norestart
C:\cpp\2013x64.exe /install /passive /norestart
C:\cpp\20152022x64.exe /install /passive /norestart