# install proxysql on centos 7
# pls select either method 1 or method 2


############################################################################################################

# install proxysql on centos 7 (method 1)
# source is downloaded from percona page

#yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm # install repo
#sleep 1
#yum -y install proxysql; service proxysql start; chkconfig proxysql on;  # install & start proxysql
#sleep 1
#echo -e "\ninstallation completed\n"


############################################################################################################

# install proxysql on centos 7 (method 2)
# source is downloaded from https://github.com/sysown/proxysql/releases

yum -y install wget
yum -y install perl
yum -y install perl-DBD-MySQL.x86_64


wget https://github.com/sysown/proxysql/releases/download/v1.4.4/proxysql-1.4.4-1-centos7.x86_64.rpm
sleep 1
rpm -ivh proxysql-1.4.4-1-centos7.x86_64.rpm
sleep 1
service proxysql start ; chkconfig proxysql on;
sleep 1
echo "installation completed"


