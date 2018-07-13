# install kimchi on centos 7

yum -y install wget
mkdir -p /root/tmp ; cd /root/tmp
wget https://github.com/kimchi-project/wok/releases/download/2.5.0/wok-2.5.0-0.el7.centos.noarch.rpm
wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.el7.centos.noarch.rpm
wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.el7.centos.noarch.rpm
yum -y install wok.el7.centos.noarch.rpm
yum -y install ginger-base.el7.centos.noarch.rpm
yum -y install kimchi.el7.centos.noarch.rpm
sed -i  's/^#session_timeout = .*/session_timeout = 1440/g' /etc/wok/wok.conf
systemctl enable wokd
systemctl start wokd

