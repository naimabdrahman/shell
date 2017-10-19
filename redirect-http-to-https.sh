# redirect http to https on centos 7

cat /var/www/html/.htaccess > /var/www/html/.htaccess.ori
touch /var/www/html/.htaccess
echo -e "RewriteEngine On" > /var/www/html/.htaccess
echo -e "RewriteCond %{HTTPS}  !=on " >> /var/www/html/.htaccess
echo -e "RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]" >> /var/www/html/.htaccess

service httpd restart



# or... Redirect HTTP to HTTPS on Apache Virtual Host
# Follow setting below without '#'

#NameVirtualHost *:80
#<VirtualHost *:80>
#ServerName www.yourdomain.com
#Redirect / https://www.yourdomain.com
#</VirtualHost>
#<VirtualHost _default_:443>
#ServerName www.yourdomain.com
#DocumentRoot /usr/local/apache2/htdocs
#SSLEngine On
# etc...
#</VirtualHost>
