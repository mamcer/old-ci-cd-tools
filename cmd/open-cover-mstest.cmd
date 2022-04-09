@echo off
SETLOCAL

@REM  ----------------------------------------------------------------------------
@REM  open-cover-mstest.cmd
@REM
@REM  author: m4mc3r@gmail.com
@REM
@REM  ----------------------------------------------------------------------------

echo.
echo =========================================================
echo   OpenCover MSTest Script                                          
echo =========================================================
echo.

pushd %~dp0
set start_time=%time%
set msbuild_bin="%PROGRAMFILES(x86)%\MSBuild\14.0\Bin\MSBuild.exe"
set working_dir=%CD%
set opencover_bin="C:\root\bin\open-cover\OpenCover.Console.exe"
set mstest_bin="%PROGRAMFILES(x86)%\Microsoft Visual Studio 14.0\Common7\IDE\mstest.exe"
set opencover_proj=C:\root\bin\cmd\open-cover.proj

@REM  shorten the command prompt for making the output easier to read
set savedPrompt=%prompt%
set prompt=$$$g$s

IF "%~1"=="" GOTO continue
set working_dir="%1"

:continue
cd %working_dir%

@REM copy open-cover.proj to source folder necessary if we want the TestResults folder is in the same folder of the code
COPY /Y %opencover_proj% .\open-cover.proj

@REM run tests
call %msbuild_bin% /p:WorkingDirectory=%working_dir% /p:OpenCoverBinPath=%opencover_bin% /p:MSTestBinPath=%mstest_bin% open-cover.proj
@if %errorlevel% NEQ 0 goto error
goto success

:error
echo an error has occurred
GOTO finish

:success
echo process successfully finished
echo start time: %start_time%
echo end time: %Time%

:finish
popd
set prompt=%savedPrompt%

echo on