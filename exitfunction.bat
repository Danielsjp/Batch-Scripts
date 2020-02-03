@echo off
set logfile=Logfile_errors.txt

(    
    call :executeOwn notepad
    call :executeOwn dsadas
    call :executeOwn dsadas
    call :executeOwn echo date
    call :executeOwn notepad
    call :executeOwn dsadas
    call :executeOwn dsadas
    call :executeOwn echo date
) 

REM Exit current batch script with error status from last executed call
exit /b %ERRORLEVEL%

:executeOwn
%* 2>> "%logfile%"
IF ERRORLEVEL 1 (
    REM Write command that was executing to log-file
    echo FAILED : [ %* ] >> "%logfile%"
    REM some extra personal errormessage if needed
    echo An error occured, consult the log-file for more info
    REM Exit current script and set errorlevel on 1 (failure)
    exit /b 1
)
echo succeeded : [ %* ] >> "%logfile%"
exit /b 0