# JDK Installation

The current latest stable version is 1.8.0_77

## Install

    cd /opt/
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz"
    tar xzf jdk-8u77-linux-x64.tar.gz

    cd /opt/jdk1.8.0_77/
    alternatives --install /usr/bin/java java /opt/jdk1.8.0_77/bin/java 2
    alternatives --config java

## Set environment variable

Add a `jdk.sh` file into `/etc/profile.d/`

With the following content

    export JAVA_HOME=/opt/jdk1.8.0_77
    export PATH=${PATH}:/opt/jdk1.8.0_77/bin 
    
Logout

    gnome-session-quit
    
## Test installation 

    java -version