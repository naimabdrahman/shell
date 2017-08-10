 yum -y update
 yum -y install epel-release
 yum -y install wget
 rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
 yum -y install httpd php56w php56w-mysql mariadb-server php56w-mcrypt php56w-dom php56w-mbstring unzip nano
 systemctl start mariadb
 systemctl start httpd
 systemctl enable mariadb
 systemctl enable httpd
 curl -k -sS https://getcomposer.org/installer | php
 echo $PATH
 mv composer.phar /usr/local/bin/composer
 cd /opt
 wget https://github.com/laravel/laravel/archive/v4.2.11.zip
 unzip v4.2.11.zip
 mkdir /var/www/html/laravel
 mv laravel-4.2.11/ /var/www/html/laravel
 cd /var/www/html/laravel
 mv laravel-4.2.11/* .
 mv laravel-4.2.11/.* .
 rmdir laravel-4.2.11/
 composer install
 chown apache: -R /var/www/html/laravel/


echo "  <VirtualHost *:80>       " >> /etc/httpd/conf.d/laravel.conf
echo "      DocumentRoot /var/www/html/laravel/public    " >> /etc/httpd/conf.d/laravel.conf
echo "      ServerName laravel.nar.test  " >> /etc/httpd/conf.d/laravel.conf
echo "           " >> /etc/httpd/conf.d/laravel.conf
echo "      <Directory /var/www/html/laravel/>   " >> /etc/httpd/conf.d/laravel.conf
echo "          AllowOverride All        " >> /etc/httpd/conf.d/laravel.conf
echo "      </Directory>         " >> /etc/httpd/conf.d/laravel.conf
echo "  </VirtualHost>   " >> /etc/httpd/conf.d/laravel.conf


service httpd restart

