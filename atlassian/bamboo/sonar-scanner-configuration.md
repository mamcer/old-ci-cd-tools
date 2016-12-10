# Sonar Scanner Configuration

Uncomment and configure sonar-scanner/conf/sonar-runner.properties keys

    sonar.host.url=http://[sonarqube-server-ip]:9000

    sonar.jdbc.username=[username]
    sonar.jdbc.password=[password]

    sonar.jdbc.url=jdbc:jtds:sqlserver://[sql-server-ip]:1433;databaseName=sonarqubedb;instance=MSSQLSERVER;SelectMethod=Cursor
    Bamboo Sonar Configuration

    Host URL: http://localhost:9000
    Username: [username]
    Password: [password]

JDBC URL: jdbc:sqlserver://localhost:1433;databaseName=sonarqubedb;instance=MSSQLSERVER  
JDBC driver: com.microsoft.sqlserver.jdbc.SQLServerDriver  
JDBC username: sonarqubedbuser  
JDBC password:  