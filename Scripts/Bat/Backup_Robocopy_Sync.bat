@echo off

:: Formatted as YYYY-MM-DD-HHMM
set TIMESTAMP="%date:~10,4%-%date:~4,2%-%date:~7,2%-%time:~0,2%%time:~3,2%"

>"C:\Users\Fournier_Desktop\Sync\Logs\%TIMESTAMP%.log" (
  robocopy "C:\Users\Fournier_Desktop" "Z:\Documents" /MIR /R:0 /W:0
)

exit