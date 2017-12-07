#uninstall mariadb completely in centos 7
yum -y remove mariadb mariadb-server
rm -rf /var/lib/mysql
rm /etc/my.cnf
