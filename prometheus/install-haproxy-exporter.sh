## install haproxy exporter on centos 7
## reference : https://github.com/prometheus/haproxy_exporter
## version : haproxy_exporter-0.10.0

## preparation
yum -y install wget


## download and install
mkdir /root/dl ; cd /root/dl
wget "https://github.com/prometheus/haproxy_exporter/releases/download/v0.10.0/haproxy_exporter-0.10.0.linux-amd64.tar.gz"
sleep 2
cd /root
mkdir /root/haproxy_exporter ; cd /root/haproxy_exporter
tar -zxvf /root/dl/haproxy_exporter-0.10.0.linux-amd64.tar.gz 
sleep 2


## quick run ==> switched off
#/root/haproxy_exporter/haproxy_exporter-0.10.0.linux-amd64/haproxy_exporter &
#/root/haproxy_exporter/haproxy_exporter-0.10.0.linux-amd64/haproxy_exporter --haproxy.scrape-uri="http://IP/haproxy?stats;csv" & 
#/root/haproxy_exporter/haproxy_exporter-0.10.0.linux-amd64/haproxy_exporter --haproxy.scrape-uri="http://user:pass@IP/haproxy?stats;csv" & ## user & password
#/root/haproxy_exporter/haproxy_exporter-0.10.0.linux-amd64/haproxy_exporter --no-haproxy.ssl-verify --haproxy.scrape-uri="https://IP/haproxy?stats;csv"  ## SSL



## create and enable service ==> switched off
func_create_service(){
touch /etc/systemd/system/haproxy_exporter.service
cat > /etc/systemd/system/haproxy_exporter.service <<EOL
[Unit]
Description=HAProxy Exporter

[Service]
User=root
ExecStart=/root/haproxy_exporter/haproxy_exporter-0.10.0.linux-amd64/haproxy_exporter --haproxy.scrape-uri="http://user:pass@IP/haproxy?stats;csv"

[Install]
WantedBy=default.target
EOL


systemctl daemon-reload
systemctl enable haproxy_exporter.service
systemctl start haproxy_exporter.service
}

echo -e "\n\n\nPls browse to http://your_server_ip:9101/metrics\n\n\n"
