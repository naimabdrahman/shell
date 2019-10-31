## install postgres exporter centos 7
## version : node_exporter-0.18

## preparation
yum -y install wget


## download and install
mkdir /root/dl
cd /root/dl
wget "https://github.com/wrouesnel/postgres_exporter/releases/download/v0.6.0/postgres_exporter_v0.6.0_linux-amd64.tar.gz"
sleep 2
cd /root
mkdir /root/postgres_exporter
cd /root/postgres_exporter
tar -zxvf /root/dl/postgres_exporter_v0.6.0_linux-amd64.tar.gz 
sleep 2


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


echo -e "\n\n\nPls browse to http://your_server_ip:postgres_exporter/metrics\n\n\n"
