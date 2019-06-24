## install wordpress on centos 7


## install apache
yum -y install httpd
service httpd start
chkconfig httpd on


## install php
yum -y install php php-mbstring php-pear 

## install mariadb client
yum -y install mariadb


## configure mysql db (assuming mysql db already installed in node2)
## need to be run in db server (most likely)
mysql -u root -ppassword -e -h node2 "create database wordpress;"
mysql -u root -ppassword -e -h node2 "grant all privileges on wordpress.* to wordpress@'node1.nar.test' identified by 'password';" 
mysql -u root -ppassword -e -h node2 "flush privileges;"

# or in mysql shell run "create database wordpress;grant all privileges on wordpress.* to wordpress@'node1.nar.test' identified by 'password';flush privileges;" 


## install wp & configure (manual)
#yum --enablerepo=epel -y install wordpress 

#echo -e "update config /etc/wordpress/wp-config.php"
#echo -e "define('DB_NAME', 'wordpress');"
#echo -e "define('DB_USER', 'wordpress');"
#echo -e "define('DB_PASSWORD', 'password'); "
#echo -e "\n\n"

#echo -e "update config /etc/httpd/conf.d/wordpress.conf"
#echo -e "Require all granted in line 8"



## install wp & configure automated step
yum --enablerepo=epel -y install wordpress 

cat /etc/wordpress/wp-config.php > /etc/wordpress/wp-config.php.bckup
sed -i 's/database_name_here/wordpress/g' /etc/wordpress/wp-config.php
sed -i 's/username_here/wordpress/g'      /etc/wordpress/wp-config.php
sed -i 's/password_here/password/g'       /etc/wordpress/wp-config.php
sed -i 's/localhost/node2.nar.test/g'     /etc/wordpress/wp-config.php

cat /etc/httpd/conf.d/wordpress.conf > /etc/httpd/conf.d/wordpress.conf.bckup
sed -i 's/Require\ local/Require\ all\ granted/g' /etc/httpd/conf.d/wordpress.conf



## restart apache manually
echo -e "\n\n\n\nrestart apache manually"
echo -e "browse to http://IP/wordpress"

