@echo off
SETLOCAL

@REM  ----------------------------------------------------------------------------
@REM  xunit-console.cmd
@REM
@REM  author: m4mc3r@gmail.com
@REM  ----------------------------------------------------------------------------

set start_time=%time%
set working_dir=%CD%
set msbuild_bin_path="%PROGRAMFILES(X86)%\MSBuild\14.0\Bin\MSBuild.exe"
set xunit-runner-console_bin_path="C:\root\bin\xunit.runner.console.2.2.0\tools\xunit.console.exe"
set xunit-runner-console_proj_path=C:\root\bin\cmd\xunit-console.proj

@REM  Shorten the command prompt for making the output easier to read
set savedPrompt=%prompt%
set prompt=$$$g$s

pushd %working_dir%

@REM copy vstestconsole.proj to source folder so the TestResults folder is in the same folder of the code
COPY /Y %xunit-runner-console_proj_path% .\xunit-console.proj

@REM run xunit-runner-console
%msbuild_bin_path% xunit-console.proj /p:WorkingDirectory="%working_dir%" /p:XunitRunnerConsoleBinPath=%xunit-runner-console_bin_path% /p:OutDir="%working_dir%"
@if %errorlevel% NEQ 0 goto error
goto success

:error
echo an error has occurred.
GOTO finish

:success
echo process successfully finished
echo start time: %start_time%
echo end time: %time%

:finish
popd
set prompt=%savedPrompt%

ENDLOCAL
echo on