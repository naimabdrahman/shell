#install webmin on centos 7
#
#
yum -y install perl-Net-SSLeay
yum -y install http://download.webmin.com/download/yum/webmin-1.750-1.noarch.rpm
service webmin restart
chkconfig webmin on
echo -e "pls login to https://(server's hostname or IP address):10000/" 
