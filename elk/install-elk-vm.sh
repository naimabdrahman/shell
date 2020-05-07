## install elk in centos 7 ##
## tested ##

## install java
yum -y install java-openjdk-devel java-openjdk

## Add ELK repository - version 7

#cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
#[elasticsearch-6.x]
#name=Elasticsearch repository for 6.x packages
#baseurl=https://artifacts.elastic.co/packages/6.x/yum
#gpgcheck=1
#gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
#enabled=1
#autorefresh=1
#type=rpm-md
#EOF


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

## Install Kibana
yum -y install kibana
#systemctl start kibana.service
#systemctl enable kibana.service
sleep 5

## Tweaking kibana config and start kibana service ##

## take backup
cat /etc/kibana/kibana.yml > /root/kibana.yml.bckup.`date +%s`

## update config via sed and start 
sed -i 's/#server.port: 5601/server.port: 5601/' /etc/kibana/kibana.yml
sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /etc/kibana/kibana.yml
sed -i 's/#elasticsearch.hosts:/elasticsearch.hosts:/g' /etc/kibana/kibana.yml
sleep 5
systemctl start kibana.service
systemctl enable kibana.service

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
echo -e "

########## tips n tricks - to check elasticsearch ########## 
curl http://elk01:9200/_cat/nodes?v ; curl http://elk01:9200/_cluster/health?pretty

curl http://elk01:9200/_cat
curl http://elk01:9200/_cat/nodes
curl http://elk01:9200/_cat/nodes?pretty
curl http://elk01:9200/_cat/nodes?v

curl http://elk01:9200/_cat
curl http://elk01:9200/_cat/health
curl http://elk01:9200/_cat/health?pretty
curl http://elk01:9200/_cat/health?v
############################################################

"

## end


