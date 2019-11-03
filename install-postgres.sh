## install PostgreSQL 9.2 on centos 7 ==> switched off

func_install_postgres9.2(){
## installation
yum -y install postgresql-server 
postgresql-setup initdb 


## enable service
systemctl start postgresql
systemctl enable postgresql 

## fw if required
#firewall-cmd --add-service=postgresql --permanent
#firewall-cmd --reload 
}


## install PostgreSQL 9.6 on centos 7 ==> switched on

func_install_postgres9.6(){
## download rpm
mkdir -p /root/dl
cd /root/dl
rpm -Uvh http://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm
cd

## installation
yum -y install postgresql96-server postgresql96

## init db
/usr/pgsql-9.6/bin/postgresql96-setup initdb

## start and enable service
systemctl start postgresql-9.6
systemctl enable postgresql-9.6

## others
echo -e "
to test tring connection; try below

psql -U postgres -h 127.0.0.1

or

PGPASSWORD=password psql -U postgres -h 127.0.0.1
"
}
func_install_postgres9.6
