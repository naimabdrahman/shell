## install rabbitmq centos8stream

dnf -y install centos-release-rabbitmq-38
sed -i -e "s/enabled=1/enabled=0/g" /etc/yum.repos.d/CentOS-Messaging-rabbitmq.repo
dnf --enablerepo=centos-rabbitmq-38,powertools -y install rabbitmq-server
systemctl enable --now rabbitmq-server 
systemctl start rabbitmq-server


## python lib for test script
dnf --enablerepo=epel -y install python3-pika


## UI
rabbitmq-plugins enable rabbitmq_management

