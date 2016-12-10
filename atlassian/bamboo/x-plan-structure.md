# Bamboo Plan Configuration

## BUILD STAGE

### BUILD JOB

####  Source Code Checkout

Source Code Checkout task

#### Script: [Delete previous zip file] 

    IF NOT EXIST source.code.zip GOTO NoZip
    erase source.code.zip
    :NoZip

3. Script: [Delete previous zip file] IF NOT EXIST build.output.zip GOTO NoZip

erase build.output.zip

:NoZip

4. Script:  [Zip Source Code] Main\Tool\7z.exe a -r -y -xr!.svn -xr!TestResults source.code.zip .\Main\Src\*.*


#### MSBuild: [Build Task] 

    msbuild solution.sln /m /p:Configuration=Debug



6. Command: [Zip Build Output] 7z(Executable) a -r -y -xr!.svn -xr!obj build.output.zip .\Main\Src\WebApplication\*.*



TEST STAGE

TEST JOB



1. Command: [Unzip Build Output] 7z(Executable) x -y build.output.zip



2. Script: [Delete Previous Test Results] IF NOT EXIST TestResults\NUL GOTO NoTestResults

rmdir /s /q TestResults

:NoTestResults

md TestResults



3. MSTestRunner: [Run Tests] ${bamboo.build.working.directory}\Src\Soulstone.Api.Test\bin\Debug\Soulstone.Api.Test.dll

TestResults\Soulstone.Api.trx



4. MSTestRunner: [RunTests] ${bamboo.build.working.directory}\Src\Soulstone.Data.Test\bin\Debug\Soulstone.Data.Test.dll

TestResults\Soulstone.Data.trx



5. MSTestParser: TestResults\Soulstone.Api.trx;TestResults\Soulstone.Data.trx



6. MSBuild: [Coverage Analysis] ${bamboo.build.working.directory}\Src\open.cover.proj

/p:WorkingDirectory=${bamboo.build.working.directory}\Src /p:OpenCoverBinPath=${bamboo.open.cover.path} /p:MSTestBinPath=${bamboo.mstest.path}

ALTERNATIVE (No OpenCoverOnAgent) /p:WorkingDirectory=${bamboo.build.working.directory}\Src /p:OpenCoverBinPath=${bamboo.open.cover.path} /p:MSTestBinPath=${bamboo.mstest.path}



7. MSBuild: [Transform OpenCover to NCover] ${bamboo.build.working.directory}\opencover.ncover.proj

/p:TestsDir=${bamboo.build.working.directory}



8. Command: [Convert OpenCover to HTML] Executable: ReportGenerator (Assuming report generator was added as executable)

-reports:${bamboo.build.working.directory}\opencover.xml -targetdir:${bamboo.build.working.directory}\coverage.report -reporttypes:Html



9. Command: [Zip Coverage HTML Report] Executable: 7z (Executable) a -r -y coverage.html.report.zip .\coverage.report\*.*



DEPLOY STAGE (Could be Manual)

DEPLOY JOB

1. Command: [Unzip Source Code] 7z(Executable) x -y source.code.zip



2. MSBuild: [Generate Deployment Package] /p:Configuration=Release /p:DeployOnBuild=true /p:DeployTarget=Package /p:CreatePackageOnBuild=True



3. Script: [Copy deployment package to share] copy WebApplication\obj\Release\Package\WebApplication.zip \\[server-ip]\public\



4. Script: [Deploy to server] WebApplication\obj\Release\Package\WebApplication.deploy.cmd /Y /M:[server-ip].com /U:[username] /P:[password] -allowUntrusted -setParamFile:Common\WebApplication.SetParameters.xml



SONAR STAGE

SONAR JOB

1. Script: [Unzip Build Output] Main\Tool\7z.exe x -y build.output.zip



2. Sonnar Runner