## install prometheus alertmanager on centos 7

## package version to be updated form time to time
#package=alertmanager-0.19.0.linux-amd64
package=alertmanager-0.20.0.linux-amd64

## prerequisuite
yum -y install wget
sleep 2
mkdir  /root/dl
cd /root/dl

## dl alertmanager 
sleep 2
#wget https://github.com/prometheus/alertmanager/releases/download/v0.19.0/$package.tar.gz
wget https://github.com/prometheus/alertmanager/releases/download/v0.20.0/$package.tar.gz
sleep 2
tar -zxvf $package.tar.gz
mv $package /root/
cd

## quick run ## switched off
#cd /root/$package/
#./alertmanager --config.file=alertmanager.yml

## create service 
touch /etc/systemd/system/alertmanager.service
cat > /etc/systemd/system/alertmanager.service <<EOL
[Unit]
Description=AlertManager

[Service]
User=root
#ExecStart=/root/alertmanager-0.19.0.linux-amd64/alertmanager --config.file /root/alertmanager-0.19.0.linux-amd64/alertmanager.yml
ExecStart=/root/alertmanager-0.20.0.linux-amd64/alertmanager --config.file /root/alertmanager-0.20.0.linux-amd64/alertmanager.yml

[Install]
WantedBy=default.target
EOL

systemctl daemon-reload
systemctl enable alertmanager.service
systemctl start alertmanager.service

## verification
sleep 2
echo -e "\n\npls browse to http://IP:9093 to verify that prometheus working properly\n\n"
