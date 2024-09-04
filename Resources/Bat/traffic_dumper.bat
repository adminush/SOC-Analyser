@echo off
set Hostname=%1
set Seconds=%2
powershell -Command "& {New-Item -Path '.\Result\%Hostname%\' -Name "Traffic" -ItemType 'directory'}"
.\Resources\PsExec.exe \\%Hostname% powershell /c "& { netsh trace start capture=yes persistent=yes tracefile=C:\tmp\%Hostname%.etl report=disabled; Start-Sleep -Seconds %Seconds%; netsh trace stop}"
powershell -Command "& {Copy-Item \\%Hostname%\C$\tmp\%Hostname%.etl -Destination .\Result\%Hostname%\Traffic\; Remove-Item \\%Hostname%\C$\tmp\%Hostname%.etl}"
.\Resources\etl2pcapng.exe Result\%Hostname%\Traffic\%Hostname%.etl Result\%Hostname%\Traffic\%Hostname%.pcapng