# Bamboo Configuraiton


## Integrating Bamboo with JIRA

[https://confluence.atlassian.com/display/BAMBOO/Integrating+Bamboo+with+JIRA]()

    JIRA

    Go to System > User Management > JIRA User Server and add Bamboo as application

        Add the IP of the Bamboo server to the list of valid IPs

    Go to System > User Management > Groups and add the group bamboo-admin with at least one member

    Bamboo

    Go to Security > User repositories select Users and groups from JIRA or Crowd and configure the application just added to JIRA

        In my case it works with JIRA (not Crowd) http://192.168.1.100:8080

## Configure SMTP with a gmail account

Go to Communication > Mail server

From: [account-name]@gmail.com

Email Settings: SMTP

SMTP Server: smtp.gmail.com

SMTP Port: 587

Username: [account-name]@gmail.com

Use TLS: yes

## Application Links

Go to Add-Ons > Application Links

Enter the JIRA url and follow the steps

## Configure Add-ons

Sonar for Bamboo  
[https://marketplace.atlassian.com/plugins/ch.mibex.bamboo.sonar4bamboo/server/overview]()

Build Status Tracker for Bamboo  
[https://marketplace.atlassian.com/plugins/com.wittified.bamboo.embedded-build-status/server/overview]()


## Configure Bamboo Executables

### Web Deploy

    Web Deploy (You can install it through Web Platform Installer Web Deploy 3.6 for Hosting Servers)

    Capability Type: Executable

    Type: Command

    Executable Label: WebDeploy

    Path: C:\Program Files\IIS\Microsoft Web Deploy V3\msdeploy.exe

### GIT

    Capability Type: Git

    Executable: Git

    Path: C:\Program Files\Git\bin\git.exe

### MSTest

    Capability Type: Executable

    Type: Visual Studio

    Executable Label: MSTest

    Path: C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE

### 7zip

    Capability Type: Executable

    Type: Command

    Executable Label: 7z

    Path: C:\root\bin\7zip\App\7-Zip\7z.exe

### OpenCover

    Capability Type: Executable

    Type: Command

    Executable Label: OpenCover

    Path: C:\root\bin\cmd\open-cover.cmd

### ReportGenerator

    Capability Type: Executable

    Type: Command

    Executable Label: ReportGenerator

    Path: C:\root\bin\cmd\report-generator.cmd

### SonarRunner

    Capability Type: Executable

    Type: Sonar Runner Home

    Executable Label: Sonar Runner Home

    Path: C:\root\bin\sonar-scanner

### VSTest.Console

    Capability Type: Executable

    Type: Command

    Executable Label: VSTest.Console

    Path: C:\root\bin\cmd\vstest-console.cmd

## Plan Structure Example

Continuous Integration

    Build
        Checkout and Compile

    Test
        Run Unit Tests

Deployment 

    Deploy
        Generate Package and Deploy

Inspection

    Sonar
        Sonar Analysis
