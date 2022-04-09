@echo off
SETLOCAL

@REM  ----------------------------------------------------------------------------
@REM  report-generator.cmd
@REM
@REM  author: m4mc3r@gmail.com
@REM
@REM  ----------------------------------------------------------------------------

echo.
echo =========================================================
echo   Report Generator Script                                          
echo =========================================================
echo.

pushd %~dp0
set start_time=%time%
set reportgenerator_bin=C:\root\bin\report-generator\ReportGenerator.exe
set working_dir=%CD%
set opencover_file=%CD%\open-cover.xml
set target_dir=%CD%\coverage-report

@REM  Shorten the command prompt for making the output easier to read
set savedPrompt=%prompt%
set prompt=$$$g$s

IF "%~1"=="" GOTO continue
set working_dir="%1"

IF "%~1"=="" GOTO continue
set opencover_file=%working_dir%\open-cover.xml

IF "%~1"=="" GOTO continue
set target_dir=%working_dir%\coverage-report

:continue
cd %working_dir%

@REM delete previous coverage report files
IF NOT EXIST coverage-report\NUL GOTO NoCoverageReport
rmdir /s /q coverage-report
:NoCoverageReport
md coverage-report

%reportgenerator_bin% -reports:%opencover_file% -targetdir:%target_dir% -reporttypes:Html
@if %errorlevel% NEQ 0 goto error
goto success

:error
echo an error has occurred.
GOTO finish

:success
echo process successfully finished.
echo start time: %start_time%
echo end time: %Time%

:finish
popd
set prompt=%savedPrompt%

echo on