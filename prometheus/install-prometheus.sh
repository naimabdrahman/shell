## install prometheus on centos 7

package=prometheus-2.12.0.linux-amd64


## preparation
yum -y install wget
sleep 2
mkdir  /root/dl
cd /root/dl


## download and unpack package
wget https://github.com/prometheus/prometheus/releases/download/v2.12.0/$package.tar.gz
sleep 2
tar -zxvf $package.tar.gz
mv $package /root/



## quick run prometheus to see if it is working ## not in used. service is created instead
#/root/prometheus-2.12.0.linux-amd64/prometheus --config.file=/root/prometheus-2.12.0.linux-amd64/prometheus.yml &

## create prometheus service
:'
touch /etc/systemd/system/prometheus.service
echo -e "[Unit]" > /etc/systemd/system/prometheus.service
echo -e "Description=Prometheus" >> /etc/systemd/system/prometheus.service
echo -e "">> /etc/systemd/system/prometheus.service
echo -e "[Service]" >> /etc/systemd/system/prometheus.service
echo -e "User=root">> /etc/systemd/system/prometheus.service
echo -e "ExecStart=/root/prometheus-2.12.0.linux-amd64/prometheus --config.file=/root/prometheus-2.12.0.linux-amd64/prometheus.yml" >> /etc/systemd/system/prometheus.service
echo -e "" >> /etc/systemd/system/prometheus.service
echo -e "[Install]" >> /etc/systemd/system/prometheus.service
echo -e "WantedBy=default.target" >> /etc/systemd/system/prometheus.service
'
touch /etc/systemd/system/prometheus.service
cat > /etc/systemd/system/prometheus.service <<EOL
[Unit]
Description=Prometheus


[Service]
User=root
ExecStart=/root/prometheus-2.12.0.linux-amd64/prometheus --config.file=/root/prometheus-2.12.0.linux-amd64/prometheus.yml
#ExecStart=/root/prometheus-2.12.0.linux-amd64/prometheus --config.file=/root/prometheus-2.12.0.linux-amd64/prometheus.yml --storage.tsdb.retention.time=30d --web.enable-lifecycle

[Install]
WantedBy=default.target
EOL


## enable service and run permanently
systemctl daemon-reload
systemctl enable prometheus.service
systemctl start prometheus.service

## verification
echo -e "\n\npls browse to http://IP:9090 to verify that prometheus working properly\n\n"
