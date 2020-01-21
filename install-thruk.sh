## install thruk on centos7 ##


## prerequisite ##
yum -y install perl
yum -y install gd
yum -y install perl-Data-Dumper
yum -y install perl-Digest
yum -y install httpd mod_fcgid
yum -y install urw-fonts
service httpd start ; chkconfig httpd on


## thruk packages for centos7 ##
mkdir -p /root/dl
wget -P /root/dl https://download.thruk.org/pkg/v2.32-3/rhel7/x86_64/libthruk-2.32-0.rhel7.x86_64.rpm
wget -P /root/dl https://download.thruk.org/pkg/v2.32-3/rhel7/x86_64/thruk-2.32-3.rhel7.x86_64.rpm
wget -P /root/dl https://download.thruk.org/pkg/v2.32-3/rhel7/x86_64/thruk-base-2.32-3.rhel7.x86_64.rpm
wget -P /root/dl https://download.thruk.org/pkg/v2.32-3/rhel7/x86_64/thruk-plugin-reporting-2.32-3.rhel7.x86_64.rpm
rpm -ivh /root/dl/libthruk-2.32-0.rhel7.x86_64.rpm
rpm -ivh /root/dl/thruk-2.32-3.rhel7.x86_64.rpm
rpm -ivh /root/dl/thruk-base-2.32-3.rhel7.x86_64.rpm
rpm -ivh /root/dl/thruk-plugin-reporting-2.32-3.rhel7.x86_64.rpm

service httpd restart
