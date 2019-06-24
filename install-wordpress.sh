## install wordpress on centos 7


## install apache
yum -y install httpd
service httpd start
chkconfig httpd on


## install php
yum -y install php php-mbstring php-pear 



## configure mysql db (assuming mysql db already installed in node2)
## need to be run in db server (most likely)
mysql -u root -ppassword -e -h node2 "create database wordpress;"
mysql -u root -ppassword -e -h node2 "grant all privileges on wordpress.* to wordpress@'node1.nar.test' identified by 'password';" 
mysql -u root -ppassword -e -h node2 "flush privileges;"



## install wp

yum --enablerepo=epel -y install wordpress 
echo -e "update config /etc/wordpress/wp-config.php"
echo -e "define('DB_NAME', 'wordpress');"
echo -e "define('DB_USER', 'wordpress');"
echo -e "define('DB_PASSWORD', 'password'); "
echo -e "\n\n"
echo -e "update config /etc/httpd/conf.d/wordpress.conf"
echo -e "Require all granted in line 8"

## restart apache manually
echo -e "\n\n\n\nrestart apache manually"
echo -e "browse to http://IP/wordpress"

