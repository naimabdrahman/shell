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
echo -e "\n\n\n####another installation notes.. squid.conf example ####\n"
echo -e "
acl localnet src 10.0.0.0/8     # RFC1918 possible internal network
acl localnet src 172.16.0.0/12  # RFC1918 possible internal network
acl localnet src fc00::/7       # RFC 4193 local private network range
acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines

acl lan src 192.168.1.0/24
acl badurl dstdomain "/etc/squid/badsites.txt"


acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT


http_access deny !Safe_ports

http_access deny CONNECT !SSL_ports

http_access allow localhost manager
http_access deny manager



http_access allow localnet
http_access allow localhost
http_access allow lan !badurl

http_access deny all

http_port 3128


coredump_dir /var/spool/squid

refresh_pattern ^ftp:           1440    20%     10080
refresh_pattern ^gopher:        1440    0%      1440
refresh_pattern -i (/cgi-bin/|\?) 0     0%      0
refresh_pattern .               0       20%     4320

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
