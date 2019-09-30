## install elk in centos 7 ##


## install java
yum -y install java-openjdk-devel java-openjdk


## Add ELK repository
cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

## import GPG key
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

## refresh yum 
yum clean all
yum makecache

## Install and Configure Elasticsearch
yum -y install elasticsearch
systemctl start elasticsearch
systemctl enable elasticsearch

## Install and Configure Kibana
yum -y install kibana
systemctl start kibana
systemctl enable kibana


## Install and Configure Logstash
yum -y install logstash
systemctl start logstash
systemctl enable logstash

## firewalld configuration

## notes
echo -e "
You can set JVM options like memory limits by editing the file: /etc/elasticsearch/jvm.options

Example below sets initial/maximum size of total heap space

-Xms1g
-Xmx1g

If your system has less memory, you can configure it to use small megabytes of ram.

-Xms256m
-Xmx512m

"

## notes
echo -e "

#######################################
5601 (Kibana web interface)
9200 (Elasticsearch JSON interface)
5044 (Logstash Beats interface, receives logs from Beats such as Filebeat)
#######################################

"



