# Windows Agent Configuration

Based on a Windows Server 2012 and without installing Visual Studio

## Install .NET 3.5 Features

From Server Manager > Add roles and features > Features > .NET Framework 3.5 Features

## Install Git for better Git support

    http://git-scm.com/

## Nuget

    EnableNuGetPackageRestore=true 

As a System Environment Variable: Computer > Properties > Advanced system settings > Environment Variables...

> Restart Atlassian Bamboo service to apply changes

## NET Framework 4.6.1 

Download from [https://go.microsoft.com/fwlink/?LinkId=671743]()

## Build Tools 2015 

Download from [https://go.microsoft.com/fwlink/?LinkId=615458]()

## Visual Studio 2015 Integrated and Isolated Shell 

Download from [http://go.microsoft.com/fwlink/?LinkId=616021]()

        isolated
        integrated

## SQL Server Data Tools 2015 

Download from [https://msdn.microsoft.com/en-us/mt186501]()

## NET 4.6 Developer Pack 

Download from [https://www.microsoft.com/en-us/download/details.aspx?id=48136]()

## NET 4.6 Targeting Pack 

Download from [https://www.microsoft.com/en-us/download/details.aspx?id=49978]()

## Agents for Visual Studio 2015 with update 1 

Download from [https://go.microsoft.com/fwlink/?LinkId=615472&clcid=0x409]()

## Web Deploy 3.6 for Hosting Servers 

You can install it using web platform installer [https://www.microsoft.com/web/downloads/platform.aspx?lang=]()

## SonarQube Scanner 

Download from [http://docs.sonarqube.org/display/SONAR/Analyzing+with+SonarQube+Scanner]()

## Target files

After all the installations I still got some missing target files errors.

The solution was to copy target files from a Visual Studio installation. 

    C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio

e.g Target files from a computer with VS2015 community edition installed:

    v10.0
    v12.0
    v14.0

> This isn't recommended as the best solution but it works