## install postgres exporter centos 7
## version : postgres_exporter_v0.6.0

## preparation
yum -y install wget


## download and install
mkdir /root/dl ; cd /root/dl
wget "https://github.com/wrouesnel/postgres_exporter/releases/download/v0.6.0/postgres_exporter_v0.6.0_linux-amd64.tar.gz"
sleep 2
cd /root
mkdir /root/postgres_exporter ; cd /root/postgres_exporter
tar -zxvf /root/dl/postgres_exporter_v0.6.0_linux-amd64.tar.gz 
sleep 2


## quick run
# mysql example : export DATA_SOURCE_NAME='mysqld_exporter:a_password@unix(/var/lib/mysql/mysql.sock)/'
# template source ==> psql postgresql://username:password@localhost:5432/mydb
export DATA_SOURCE_NAME="postgresql://postgres:password@localhost:5432/postgres?sslmode=disable" 
# /root/postgres_exporter/postgres_exporter_v0.6.0_linux-amd64/postgres_exporter &

## environment
# template source ==> psql postgresql://username:password@localhost:5432/mydb
cat >> /etc/environment << EOL
export DATA_SOURCE_NAME="postgresql://postgres:password@localhost:5432/postgres?sslmode=disable"
EOL
source /etc/environment


## create service
touch /etc/systemd/system/postgres_exporter.service
cat > /etc/systemd/system/postgres_exporter.service <<EOL
[Unit]
Description=Postgres Exporter

[Service]
User=root
ExecStart=/root/postgres_exporter/postgres_exporter_v0.6.0_linux-amd64/postgres_exporter 

[Install]
WantedBy=default.target
EOL


## enable service
systemctl daemon-reload
systemctl enable postgres_exporter.service
systemctl start postgres_exporter.service


echo -e "\n\n\nPls browse to http://your_server_ip:9187/metrics\n\n\n"
