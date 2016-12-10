# Bamboo Agent Installation

Logged in in the server where we want to install the agent.

## Install JDK

See linux-jdk.md

## Add bamboo-agent user

As sudo:

    adduser bamboo-agent
    passwd bamboo-agent

login as the bamboo-agent user

    su - bamboo-agent

## Download Remote Agent JAR

Logged in as the bamboo user you can download the agent jar:

wget https://[bamboo-server-ip]/agentServer/agentInstaller/atlassian-bamboo-agent-installer-5.14.3.jar

## Run the Agent

java -jar atlassian-bamboo-agent-installer-5.14.3.jar https://[bamboo-server-ip]/agentServer/ &

> In a ssh session you can append & at the end to leave the process running in background

## Approve the Agent

In Bamboo go to Agents > Agent authentication

and explicitly approve the agent in bamboo

## Docker (Only)

To avoid the need of sudo to run docker

    sudo groupadd docker
    sudo gpasswd -a bamboo-agent docker
    sudo service docker restart

## Open Firewall Ports

    /sbin/iptables -L
    vi /etc/sysconfig/iptables 

Add lines like the following:

-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 8085 -s [bamboo-server-ip] -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 54663 -s [bamboo-server-ip] -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -s [bamboo-server-ip] -j ACCEPT

Specifying the correct IP address (:wq to save and close)

    sudo /sbin/service iptables restart
    /sbin/iptables -L

In minutes the agent should appear in the list of online agents

## Proposed Structure

/home
    /bamboo-agent
		[bamboo-agent-home-directory]
/opt/
	bamboo/
		7z/
		ant/
		maven3/
		sonar-scanner/
		etc…

## Source and More Information

[https://confluence.atlassian.com/bamboo/additional-remote-agent-options-436044733.html]()  
[https://confluence.atlassian.com/bamboo/bamboo-remote-agent-installation-guide-289276832.html]()