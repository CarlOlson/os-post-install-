@echo off

dism /online /Disable-Feature /FeatureName:Internet-Explorer-Optional-amd64 /NoRestart
dism /online /Disable-Feature /FeatureName:MediaPlayback /NoRestart
dism /online /Disable-Feature /FeatureName:WindowsMediaPlayer /NoRestart
dism /online /Disable-Feature /FeatureName:Windows-Defender /Remove /NoRestart

dism /online /Enable-Feature /FeatureName:Microsoft-Windows-Subsystem-Linux /NoRestart

pause
