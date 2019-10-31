## install postgresql on centos 7

## installation
yum -y install postgresql-server 

postgresql-setup initdb 



## enable service
systemctl start postgresql
systemctl enable postgresql 

## fw if required
#firewall-cmd --add-service=postgresql --permanent
#firewall-cmd --reload 
