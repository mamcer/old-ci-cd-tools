# SQL Server 2014

version 12.0.2000

- Install SQL Server 2014 Express

[https://www.microsoft.com/en-US/download/details.aspx?id=42299]()

- Configure SQL Server and Windows Authentication mode (you can do this later)

- [optional] Configure default collation: SQL_Latin1_General_CP1_CI_AS

## Remote Access

- Configure Firewall to allow SQL Server access (default port 1433)

- From Management Studio, right click Server > Properties > Connections > Allow remote connections to this server

- From Management Studio, right click Server > Properties > Security > Server Authentication SQL Server and Windows Authentication Mode

- Go to SQL Server Configuration Manager

- SQL Server Network Configuration > Protocols for [ServerName] > Make sure TCP/IP protocol is enabled

- Right-click on TCP/IP and select Properties.
- Verify that, under IP2, the IP Address is set to the computer's IP address on the local subnet.
- Scroll down to IPAll.
- Make sure that TCP Dynamic Ports is blank. (Mine was set to some 5-digit port number.)
- Make sure that TCP Port is set to 1433. (Mine was blank.)
- (Also, if you follow these steps, it's not necessary to enable SQL Server Browser, and you only need to allow port 1433, not 1434.)

- Restart SQL Server Service

## Links 

[http://stackoverflow.com/questions/11278114/enable-remote-connections-for-sql-server-express-2012]()