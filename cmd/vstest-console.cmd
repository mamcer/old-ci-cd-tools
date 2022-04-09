@echo off
SETLOCAL

@REM  ----------------------------------------------------------------------------
@REM  vstest-console.cmd
@REM
@REM  author: m4mc3r@gmail.com
@REM
@REM  ----------------------------------------------------------------------------

echo.
echo =========================================================
echo   VSTest Console Script                                          
echo =========================================================
echo.

set start_time=%time%
set vstestconsole_proj=C:\root\bin\cmd\vstest-console.proj
set msbuild_bin=%PROGRAMFILES(X86)%\MSBuild\14.0\Bin\MSBuild.exe
set working_dir=%CD%
set vstestconsole_bin=%PROGRAMFILES(X86)%\Microsoft Visual Studio 14.0\Common7\IDE\CommonExtensions\Microsoft\TestWindow\vstest.console.exe

@REM  Shorten the command prompt for making the output easier to read
set savedPrompt=%prompt%
set prompt=$$$g$s

IF "%~1"=="" GOTO continue
set working_dir="%1"

:continue
pushd %working_dir%

@REM delete previous test results
IF NOT EXIST TestResults\NUL GOTO NoTestResults
rmdir /s /q TestResults
:NoTestResults
md TestResults

@REM copy vstestconsole.proj to source folder so the TestResults folder is in the same folder of the code
COPY /Y %vstestconsole_proj% .\vstest-console.proj

@REM execute vstest console recursively from a working directory
"%msbuild_bin%" vstest-console.proj /p:WorkingDirectory="%working_dir%" /p:VSTestConsoleBinPath="%vstestconsole_bin%"  /p:OutDir="%working_dir%"
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