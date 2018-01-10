# install proxysql exporter on centos 7

# install golang on centos 7  (prerequisite)
# repo is located in https://go-repo.io/
rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
sleep 1
curl -s https://mirror.go-repo.io/centos/go-repo.repo | tee /etc/yum.repos.d/go-repo.repo
sleep 1
yum -y install golang
sleep 1



# install & start proxysql exporter
go get github.com/percona/proxysql_exporter
sleep 1
cd /root/go/src/github.com/percona/proxysql_exporter/
sleep 1
make
sleep 1
export DATA_SOURCE_NAME='stats:stats@tcp(127.0.0.1:42004)/'
sleep 1
export HTTP_AUTH='user:password'
sleep 1
./proxysql_exporter &
sleep 2
echo -e "\ninstallation completed\n"

# to rerun again
echo -e "\nto rerun proxysql exporter again in future\n" 
echo -e "\nexport DATA_SOURCE_NAME='stats:stats@tcp(127.0.0.1:42004)/'\n"
echo -e "\nexport HTTP_AUTH='user:password'\n"
echo -e "\n./proxysql_exporter &\n"

