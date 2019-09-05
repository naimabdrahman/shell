## install node exporter centos 7
## version : node_exporter-0.18

yum -y install wget

mkdir /root/dl
cd /root/dl
#wget "https://github.com/prometheus/node_exporter/releases/download/0.11.0/node_exporter-0.11.0.linux-amd64.tar.gz" #old
wget "https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz"
sleep 2

cd /root
mkdir /root/node_exporter
cd /root/node_exporter
#tar -zxvf /root/dl/node_exporter-0.11.0.linux-amd64.tar.gz #old
tar -zxvf /root/dl/node_exporter-0.18.1.linux-amd64.tar.gz 
sleep 2


touch /etc/systemd/system/node_exporter.service
echo -e "[Unit]" > /etc/systemd/system/node_exporter.service
echo -e "Description=Node Exporter" >> /etc/systemd/system/node_exporter.service
echo -e "">> /etc/systemd/system/node_exporter.service
echo -e "[Service]" >> /etc/systemd/system/node_exporter.service
echo -e "User=root">> /etc/systemd/system/node_exporter.service
#echo -e "ExecStart=/root/node_exporter/node_exporter" >> /etc/systemd/system/node_exporter.service #old
echo -e "ExecStart=node_exporter/node_exporter-0.18.1.linux-amd64/node_exporter" >> /etc/systemd/system/node_exporter.service
echo -e "" >> /etc/systemd/system/node_exporter.service
echo -e "[Install]" >> /etc/systemd/system/node_exporter.service
echo -e "WantedBy=default.target" >> /etc/systemd/system/node_exporter.service


## tweak path
mv /etc/systemd/system/multi-user.target.wants/node_exporter.service /usr/lib/systemd/system/



## enable service
systemctl daemon-reload
systemctl enable node_exporter.service
systemctl start node_exporter.service


echo -e "\n\n\nPls browse to http://your_server_ip:9100/metrics\n\n\n"

