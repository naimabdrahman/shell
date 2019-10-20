## WIP
## install jmx exporter centos 7
## version : jmx_exporter-parent-0.12.0

## preparation
yum -y install wget


## download
mkdir /root/dl
cd /root/dl
#wget "https://github.com/prometheus/jmx_exporter/archive/parent-0.12.0.tar.gz"
wget "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.12.0/jmx_prometheus_javaagent-0.12.0.jar"
sleep 2

## setup exporter
cd /root
mkdir /root/jmx_exporter
cd /root/jmx_exporter
scp -r /root/dl/jmx_prometheus_javaagent-0.12.0.jar .
cat > config.yaml <<EOL
---
startDelaySeconds: 0
hostPort: 127.0.0.1:1234
username: 
password: 
jmxUrl: service:jmx:rmi:///jndi/rmi://127.0.0.1:1234/jmxrmi
ssl: false
lowercaseOutputName: false
lowercaseOutputLabelNames: false
whitelistObjectNames: ["org.apache.cassandra.metrics:*"]
blacklistObjectNames: ["org.apache.cassandra.metrics:type=ColumnFamily,*"]
rules:
  - pattern: 'org.apache.cassandra.metrics<type=(\w+), name=(\w+)><>Value: (\d+)'
    name: cassandra_$1_$2
    value: $3
    valueFactor: 0.001
    labels: {}
    help: "Cassandra metric $1 $2"
    type: GAUGE
    attrNameSnakeCase: false
EOL




## quick test



touch /etc/systemd/system/jmx_exporter.service
cat > /etc/systemd/system/jmx_exporter.service <<EOL
[Unit]
Description=JMX Exporter

[Service]
User=root
ExecStart=/root/jmx_exporter/jmx_exporter-parent-0.12.0/node_exporter

[Install]
WantedBy=default.target
EOL


## enable service
systemctl daemon-reload
systemctl enable jmx_exporter.service
systemctl start jmx_exporter.service


echo -e "\n\n\nPls browse to http://your_server_ip:9100/metrics\n\n\n"

