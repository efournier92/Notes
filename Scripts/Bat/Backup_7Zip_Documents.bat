@echo off

:: Name:        ZipBackup_Documents
:: Description: Backs up all document directories to a 7z archive
:: Autor:       E Fournier

:: Formatted as YYYY-MM-DD-HHMM
set TIMESTAMP="%date:~10,4%-%date:~4,2%-%date:~7,2%-%time:~0,2%%time:~3,2%"

set ZIPEXE="C:\Program Files\7-Zip\7z.exe"
set LOGDIR="C:\Users\FournierDesktop\Sync\Logs\Documents"
set ZIPDIR="F:\Zips\Documents"
set HOMEDIR="C:\Users\FournierDesktop"
set DATADIR="D:"

if not exist "%LOGDIR%" mkdir "%LOGDIR%"
if not exist "%ZIPDIR%" mkdir "%ZIPDIR%"

>"%LOGDIR%\%TIMESTAMP%.log" (
  %ZIPEXE% a^
  -t7z "%ZIPDIR%\%TIMESTAMP%.7z"^
  "%HOMEDIR%\Contacts"^
  "%HOMEDIR%\Desktop"^
  "%DATADIR%\Documents"^
  "%DATADIR%\Downloads"^
  "%DATADIR%\Scans"^
  "%DATADIR%\Sync"
)

