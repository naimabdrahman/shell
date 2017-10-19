#install apache centos7

yum -y install httpd 
service httpd start
chkconfig httpd on
