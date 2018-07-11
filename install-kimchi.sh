# install kimchi on centos 7

mkdir -p /root/tmp ; cd /root/tmp
wget http://kimchi-project.github.io/wok/downloads/latest/wok.el7.centos.noarch.rpm
wget http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.el7.centos.noarch.rpm
wget http://kimchi-project.github.io/kimchi/downloads/latest/kimchi.el7.centos.noarch.rpm
yum -y install wok.el7.centos.noarch.rpm
yum -y install ginger-base.el7.centos.noarch.rpm
yum -y install kimchi.el7.centos.noarch.rpm
sed -i  's/^#session_timeout = .*/session_timeout = 1440/g' /etc/wok/wok.conf
systemctl enable wokd
systemctl start wokd

