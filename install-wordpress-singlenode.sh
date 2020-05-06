## install wordpress single host


## install db 
yum -y install mariadb mariadb-server
service mariadb start ;chkconfig mariadb on

## mysql_secure_installation
curl https://raw.githubusercontent.com/naimabdrahman/db/master/mysql_secure_installation.sh > /root/mysql_secure_installation.sh
chmod +x /root/mysql_secure_installation.sh
/root/mysql_secure_installation.sh password


## setup wordpress db
mysql -u root -ppassword -h localhost -e "create database wordpress;"
mysql -u root -ppassword -h localhost -e "grant all privileges on wordpress.* to wordpress@'localhost' identified by 'password';"
mysql -u root -ppassword -h localhost -e "flush privileges;"


## httpd
yum -y install httpd ; service httpd start ; chkconfig httpd on
yum -y install php php-mbstring php-pear


## wordpress
# install
yum --enablerepo=epel -y install wordpress

# configure wp-config.php
cat /etc/wordpress/wp-config.php > /etc/wordpress/wp-config.php.bckup
sed -i 's/database_name_here/wordpress/g' /etc/wordpress/wp-config.php
sed -i 's/username_here/wordpress/g'      /etc/wordpress/wp-config.php
sed -i 's/password_here/password/g'       /etc/wordpress/wp-config.php
diff /etc/wordpress/wp-config.php /etc/wordpress/wp-config.php.bckup

# configure wordpress.conf
cat /etc/httpd/conf.d/wordpress.conf > /etc/httpd/conf.d/wordpress.conf.bckup
sed -i 's/Require\ local/Require\ all\ granted/g' /etc/httpd/conf.d/wordpress.conf
diff /etc/httpd/conf.d/wordpress.conf /etc/httpd/conf.d/wordpress.conf.bckup

## restart service and validate
service httpd restart
#echo -e "\n\n\n\nrestart apache manually"
echo -e "browse to http://IP/wordpress"


