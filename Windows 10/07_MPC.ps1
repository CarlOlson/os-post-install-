if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

# XySubFilter
wget https://github.com/Cyberbeing/xy-VSFilter/releases/download/3.1.0.746/XySubFilter_3.1.0.746_x64_BETA3.zip -OutFile xysubfilter.zip
Unzip xysubfilter.zip "C:\xysubfilter"
Remove-Item xysubfilter.zip
C:\xysubfilter\Install_XySubFilter.bat

# MadVR
wget http://madshi.net/madVR.zip -OutFile madvr.zip
Unzip madvr.zip "C:\madvr"
Remove-Item madvr.zip
Copy-Item madvr_settings.bin "C:\madvr\settings.bin"
C:\madvr\install.bat

# SVP
wget http://www.svp-team.com/files/svp4-free-online.exe -OutFile svp.exe

Pause