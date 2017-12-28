# install keepalived on centos 7
# this is an example of keeplived framework with haproxy - to make high availability haproxy
# make sure the configuration file (keepalived.config.txt) is properly configured

yum -y install keepalived; service keepalived start ; chkconfig keepalived on
sleep 1
yum -y install psmisc.x86_64
sleep 1


# copying config file template into keepalived config
cat /root/git/shell/keepalived/keepalived.config.txt > /etc/keepalived/keepalived.conf 
sleep 1
service keepalived restart

echo "installation completed"


