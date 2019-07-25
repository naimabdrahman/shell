## WIP
## install rundeck on centos 7


# install java
yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel 

# install Rundeck
mkdir -p /root/temp-rundeck
cd /root/temp-rundeck
rpm -Uvh http://repo.rundeck.org/latest.rpm 
yum -y install rundeck


# start rundeck service
service rundeckd start
chkconfig rundeckd on

# additional configuration
echo -e "\n\nfor additional configuration, pls refer to properties configuration in /root/git/shell/rundeck/"


# additional fw configuration (if used)
#firewall-cmd --zone=public --add-port=4440/tcp --permanent
#firewall-cmd --reload



# login information
echo -e "Navigate to http://Server_IP_Address:4440/" 
echo -e "the Default username is admin and the password is admin"


