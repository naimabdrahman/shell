## install prometheus alertmanager on centos 7

package=alertmanager-0.19.0.linux-amd64

yum -y install wget
sleep 2
mkdir  /root/dl
cd /root/dl

sleep 2
wget https://github.com/prometheus/alertmanager/releases/download/v0.19.0/$package.tar.gz
sleep 2
tar -zxvf $package.tar.gz
mv $package /root/
cd /root/$package/

sleep 2
./alertmanager --config.file=alertmanager.yml


sleep 2
echo -e "\n\npls browse to http://IP:9093 to verify that prometheus working properly\n\n"
