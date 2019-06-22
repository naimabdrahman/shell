## install chrony on centos 7
## fw is off and selinux is off

yum -y install chrony 
service chronyd start
chkconfig chronyd on
