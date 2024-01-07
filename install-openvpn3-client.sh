## install openvpn3 client on centos stream 8

yum -y update
yum -y install dnf-plugins-core
yum config-manager --set-enabled powertools
yum config-manager --set-enabled PowerTools
#yum config-manager
#yum repolist
yum -y install https://packages.openvpn.net/openvpn-openvpn3-epel-repo-1-1.noarch.rpm
yum -y install openvpn3-client
