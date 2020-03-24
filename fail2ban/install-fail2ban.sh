## install fail2ban - > centos 7

## epel
yum -y install epel-release

## fail2ban
yum -y install fail2ban
service fail2ban start
chkconfig fail2ban on
