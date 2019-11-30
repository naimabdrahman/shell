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

## installation notes - another tips
echo -e "
FYI ...
## control - allow/deny IP x.x.x.x to internet 
acl specialIP src x.x.x.x
http_access allow specialIP 
http_access deny specialIP


## that would deny anybody in the 192.168.12.0/24 subnet access to microsoft.com...
acl banned_clients src 192.168.12.0/255.255.255.0
acl sucky_url dstdomain .microsoft.com
http_access deny banned_clients sucky_url



## that would deny anybody in the 192.168.12.0/24 subnet access to microsoft.com...
acl banned_clients src 192.168.12.12-192.168.12.65
acl sucky_urls dstdomain .microsoft.com .sco.com .doubleclick.com
http_access deny banned_clients sucky_urls
"



## additional conf for squid if required for blacklisted sites ==> switched off ##


## declaring blacklisted sites
#touch /etc/squid/blacklisted_sites.acl
#echo -e "
#FYI...
#blacklisted sites: /etc/squid/blacklisted_sites.acl
#"

## backup squid config
#cat /etc/squid/squid.conf > /etc/squid/squid.conf.bckup.`date +%s`

## new squid config
#cat >> /etc/squid/squid.conf <<EOL


## blacklisted sites
#acl bad_urls dstdomain "/etc/squid/blacklisted_sites.acl"
#http_access deny bad_urls
#EOL

## restart squid 
#systemctl restart squid
