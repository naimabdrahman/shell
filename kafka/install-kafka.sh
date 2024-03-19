## https://medium.com/bina-nusantara-it-division/installing-apache-kafka-on-rocky-linux-or-centos-36458d4a3c26
## install kafka on xentos

yum -y install java-17-openjdk java-17-openjdk-devel

mkdir -p /temp
#wget -P /temp https://downloads.apache.org/kafka/3.5.1/kafka_2.13-3.5.1.tgz
wget -P /temp https://archive.apache.org/dist/kafka/3.5.1/kafka_2.13-3.5.1.tgz
#tar -xvzf /temp/kafka_2.13-3.5.1.tgz
tar -xvzf /temp/kafka_2.13-3.5.1.tgz -C /temp

mv /temp/kafka_2.13-3.5.1 /usr/local/kafka

cat > /etc/systemd/system/zookeeper.service <<EOF
[Unit]
Description=Apache Zookeeper server
Documentation=http://zookeeper.apache.org
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
ExecStart=/usr/bin/bash /usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties
ExecStop=/usr/bin/bash /usr/local/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
EOF

cat > /etc/systemd/system/kafka.service <<EOF
[Unit]
Description=Apache Kafka Server
Documentation=http://kafka.apache.org/documentation.html
Requires=zookeeper.service

[Service]
Type=simple
Environment="JAVA_HOME=/usr/lib/jvm/jre-17-openjdk"
ExecStart=/usr/bin/bash /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
ExecStop=/usr/bin/bash /usr/local/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

systemctl start zookeeper
systemctl start kafka 

systemctl status zookeeper kafka


## config ==> /usr/local/kafka/config
## config ==> /usr/local/kafka/config/zookeeper.properties
## config ==> /usr/local/kafka/config/server.properties
