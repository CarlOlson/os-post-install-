if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}

function ShowFileExtensions() 
{
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . HideFileExt "0"
    Pop-Location
}

function ShowHiddenFiles() 
{
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . Hidden "1"
    Pop-Location
}

function ShowTaskbarIcons()
{
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer
    Set-ItemProperty . EnableAutoTray 0
    Pop-Location
}

function RemapKeys()
{
    Push-Location
    Set-Location 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout'
    Set-ItemProperty . 'Scancode Map' ([byte[]](
        0,0,0,0,
        0,0,0,0, 
        2,0,0,0,             # lines left
        0x5B,0xE0,0x3A,0x00, # win <- caps
        0x38,0x00,0x1D,0x00, # lalt <- lctrl
        0x1D,0x00,0x38,0x00, # lctrl <- lalt
        0x38,0x00,0x38,0xE0, # lalt <- ralt
        0,0,0,0))            # null
    Pop-Location
}

function DisableDefender()
{
    Set-MpPreference -DisableRealtimeMonitoring $true
    Push-Location
    Set-Location 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender'
    Set-ItemProperty -Path . -Name DisableAntiSpyware -Value 1 -Type DWord
    Pop-Location
}

ShowFileExtensions
ShowHiddenFiles
ShowTaskbarIcons
RemapKeys
DisableDefender
Stop-Process -processName: Explorer
Pause