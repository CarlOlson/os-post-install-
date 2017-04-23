@echo off

REM install pacman
choco install msys2 -y

REM install emacs
yes | pacman -S mingw-w64-x86_64-emacs

REM add emacs shortcut
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%USERPROFILE%\Desktop\emacs.lnk'); $S.TargetPath = 'C:\tools\msys64\mingw64.exe'; $S.Arguments = 'runemacs'; $S.IconLocation = 'C:\tools\msys64\mingw64\bin\runemacs.exe'; $S.Save()"

REM install git
choco install git -y