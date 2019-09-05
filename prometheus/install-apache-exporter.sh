## install apache exporter on centos 7
## make sure golang is installed
## step modified from https://machineperson.github.io/monitoring/2016/01/04/exporting-apache-metrics-to-prometheus.html


# install golang on centos 7
# repo is located in https://go-repo.io/
rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | tee /etc/yum.repos.d/go-repo.repo
yum -y install golang


mkdir ~/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
source ~/.bashrc

echo -e "... downloading apache_exporter"
go get github.com/neezgee/apache_exporter
echo -e "... apache_exporter downloaded"

sleep 2
ln -s ~/go/bin/apache_exporter /usr/bin
/usr/bin/apache_exporter > /root/LOG-apache-exporter 2>&1 &

echo -e "browse to http://your_server_ip:9117/metrics to verify"

