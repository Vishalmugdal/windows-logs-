@echo off

set currentDate=%date:~10,4%-%date:~7,2%-%date:~4,2%
set currentTime=%time:~0,2%-%time:~3,2%-%time:~6,2%


set logPath=D:\win_logs
set zipPath=D:\win_zip

md "%logPath%" 2>nul
md "%zipPath%" 2>nul

wevtutil epl Application "%logPath%\Application-%currentDate%_%currentTime%.evtx"
wevtutil epl System "%logPath%\System-%currentDate%_%currentTime%.evtx"
wevtutil epl Security "%logPath%\Security-%currentDate%_%currentTime%.evtx"
wevtutil epl Setup "%logPath%\Setup-%currentDate%_%currentTime%.evtx"

set zipName=Logs-%currentDate%  _%currentTime%.zip

powershell Compress-Archive -Path "%logPath%\*.evtx" -DestinationPath "%zipPath%\%zipName%"

del /q "%logPath%\*.evtx"
pause

exit


