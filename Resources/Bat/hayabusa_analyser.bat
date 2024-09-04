@echo off
set Hostname=%1
set Logs=%2
if %Logs%==all (echo Analyse Security log:)
if %Logs%==all (.\Resources\hayabusa\hayabusa-2.17.0-win-x64.exe csv-timeline --file .\Result\%Hostname%\Logs\%Hostname%-Security.evtx -o .\Result\%Hostname%\%Hostname%-Security-hayabusa.csv)
if %Logs%==all (echo Analyse Sysmon log:)
if %Logs%==all (.\Resources\hayabusa\hayabusa-2.17.0-win-x64.exe csv-timeline --file .\Result\%Hostname%\Logs\%Hostname%-Sysmon.evtx -o .\Result\%Hostname%\%Hostname%-Sysmon-hayabusa.csv)
if %Logs%==s1 (.\Resources\hayabusa\hayabusa-2.17.0-win-x64.exe csv-timeline --file .\Result\%Hostname%\Logs\%Hostname%-Security.evtx -o .\Result\%Hostname%\%Hostname%-Security-hayabusa.csv)
if %Logs%==s2 (.\Resources\hayabusa\hayabusa-2.17.0-win-x64.exe csv-timeline --file .\Result\%Hostname%\Logs\%Hostname%-Sysmon.evtx -o .\Result\%Hostname%\%Hostname%-Sysmon-hayabusa.csv)
pause