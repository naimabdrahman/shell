## requirement
yum -y install centos-release-scl.noarch centos-sclo-rh
yum --enablerepo=centos-sclo-rh -y install rh-php70 rh-php70-php rh-php70-php-pear rh-php70-php-mbstring rh-php70-php-pdo rh-php70-php-intl rh-php70-php-gd rh-php70-php-mysqlnd httpd24


## oc installation
wget http://download.owncloud.org/download/repositories/stable/CentOS_7/ce:stable.repo -P /etc/yum.repos.d
yum -y install owncloud-files
ln -s /var/www/html/owncloud /opt/rh/httpd24/root/var/www/html/owncloud
systemctl start httpd24-httpd
systemctl enable httpd24-httpd

## db
yum -y install mariadb-server
service mariadb start; chkconfig mariadb on

curl -O https://raw.githubusercontent.com/naimabdrahman/db/master/mysql_secure_installation.sh /root/mysql_secure_installation.sh
chmod +x /root/mysql_secure_installation.sh
/root/mysql_secure_installation.sh password

mysql -uroot -ppassword -e "create database owncloud; grant all privileges on owncloud.* to owncloud@'%' identified by 'password'; flush privileges;"

## verification
echo -e "
installation completed

pls browse http://IP/owncloud to validate

"
