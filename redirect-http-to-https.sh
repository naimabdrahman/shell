#redirect http to https on centos 7

cat /var/www/html/.htaccess > /var/www/html/.htaccess.ori
touch /var/www/html/.htaccess
echo -e "RewriteEngine On" > /var/www/html/.htaccess
echo -e "RewriteCond %{HTTPS}  !=on " >> /var/www/html/.htaccess
echo -e "RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]" >> /var/www/html/.htaccess

service httpd restart
