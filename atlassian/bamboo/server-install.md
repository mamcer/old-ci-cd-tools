# Bamboo

Install JDK ´jdk-8u111-windows-x64.exe´ (is the latest version at the moment of this write)

Set JAVA_HOME=C:\root\bin\java\jdk1.8.0_111

> Computer > Properties > Advanced system settings > Environment Variables...

You can check that Java is installed running: %JAVA_HOME%\bin\java -version

## SQL Server

1. Create a bamboo user (e.g. bamboodbuser)

2. Create a database for Bamboo (e.g. bamboodb)
	> Configure the database to use case-sensitive collation (e.g. Latin1_General_CS_AS)

3. Assign the 'db-owner' role on the database to the bamboo user

4. Configure the database to use the correct isolation level

    ALTER DATABASE <database name> SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE;

To verify the changes run the following query:

	SELECT sd.is_read_committed_snapshot_on FROM sys.databases AS sd WHERE sd.[name] = '<database name>';

5. JDBC is generally simpler and is the recommended method to configure Bamboo with SQL Server

## Install Bamboo

destination directory: C:\root\bin\atlassian\bamboo
data directory: C:\root\bin\atlassian\app-data\bamboo-home

See screenshots [old]

## Run Bamboo as a Service

- Run C:\root\bin\atlassian\bamboo\InstallAsService.bat
- Run services.msc
- Configure Apache Tomcat Bamboo service with an admin account
- Start Apache Tomcat Bamboo service

## Firewall

Enable TCP port 8085

## Configure Bamboo

Navigate to http://localhost:8085

Directories

- Configuration directory: C:\root\bin\atlassian\app-data\bamboo-home\xml-data\configuration
- Build data directory: C:\root\bin\atlassian\app-data\bamboo-home\xml-data\builds
- Build working directory: C:\root\bin\atlassian\app-data\bamboo-home\xml-data\build-dir
- Artifacts directory: C:\root\bin\atlassian\app-data\bamboo-home\artifacts

See screenshots [old]

If you use a custom DB (recommended) make sure that the remote access to the database server is configured.

