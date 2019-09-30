## install squid on centos 7

## installation and enable servoice permanently
yum -y install squid
systemctl start squid
systemctl  enable squid

## installation notes
echo -e "
FYI...
Squid configuration file: /etc/squid/squid.conf
Squid Access log: /var/log/squid/access.log
Squid Cache log: /var/log/squid/cache.log
"


## additional conf for squid if required for blacklisted sites ##


## declaring blacklisted sites
touch /etc/squid/blacklisted_sites.acl
echo -e "
FYI...
blacklisted sites: /etc/squid/blacklisted_sites.acl
"

## backup squid config
cat /etc/squid/squid.conf > /etc/squid/squid.conf.bckup.`date +%s`

## new squid config
cat >> /etc/squid/squid.conf <<EOL


## blacklisted sites
acl bad_urls dstdomain "/etc/squid/blacklisted_sites.acl"
http_access deny bad_urls
EOL

## restart squid 
systemctl restart squid
