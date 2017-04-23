@echo off

REM install chocolatey
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install googlechrome -y

choco install steam -y

choco install mpc-hc -y

choco install mpv -y

choco install msiafterburner -y