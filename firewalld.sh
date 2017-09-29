# Adding new rules/port in firewalld

service firewalld start
firewall-cmd --permanent --add-port=22/tcp
firewall-cmd --permanent --add-port=27017/tcp
firewall-cmd --reload
chkconfig firewalld on
