@echo off

REM compress OS
compact.exe /CompactOS:always

start Taskmgr.exe

powercfg.exe /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

pause