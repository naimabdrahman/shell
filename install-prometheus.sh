#install prometheus on centos 7
#

yum -y install wget
sleep 2
mkdir  /root/dl
cd /root/dl

sleep 2
wget https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
sleep 2
tar -zxvf prometheus-2.0.0.linux-amd64.tar.gz
mv prometheus-2.0.0.linux-amd64 /root/
cd /root/prometheus-2.0.0.linux-amd64/

sleep 2
./prometheus --config.file=prometheus.yml &

sleep 2
echo -e "\n\npls browse to http://IP:9090 to verify that prometheus working properly\n\n"
