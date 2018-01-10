#install proxysql on centos 7


yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm # install repo
sleep 2
yum -y install proxysql; service proxysql start; chkconfig proxysql on;  # install & start proxysql
sleep 2

echo -e "\ninstallation completed\n"
