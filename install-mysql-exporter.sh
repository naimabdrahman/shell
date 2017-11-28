# mysql exporter on centos 7
# source https://www.robustperception.io/monitoring-mysqld-with-prometheus/
# prerequisites - mariadb should ve been installed and service is up

mysql -u root -p'password' -e "CREATE USER 'mysqld_exporter'@'localhost' IDENTIFIED BY 'a_password';"
mysql -u root -p'password' -e "GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'mysqld_exporter'@'localhost' WITH MAX_USER_CONNECTIONS 3;"

sleep 2
yum -y install wget
mkdir /root/dl
cd /root/dl
wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.9.0/mysqld_exporter-0.9.0.linux-amd64.tar.gz
sleep 2
cd /root
tar -xzvf /root/dl/mysqld_exporter-0.9.0.linux-amd64.tar.gz
sleep 2

cd /root/mysqld_exporter-0.9.0.linux-amd64
export DATA_SOURCE_NAME='mysqld_exporter:a_password@unix(/var/run/mysqld/mysqld.sock)/'
sleep 2
./mysqld_exporter &

echo -e "\n\nbrowse to http://localhost:9104/metrics\n\n" 


echo -e "you may add the config below in prometheus.yml\n"
echo -e "scrape_configs:"
echo -e " - job_name: 'mysqld'"
echo -e "   static_configs:"
echo -e "    - targets:"
echo -e "      - localhost:9104"


echo -e "\n"
