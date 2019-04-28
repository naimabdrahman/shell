## WAF project
## ModSecurity (default setup) tested on centos 7


# Install epel , apache and mod_security with default setup
yum -y install epel-release vim
yum -y install httpd ; service httpd restart
yum -y install mod_security mod_security_crs


# verify SecRuleEngine is on
cat  /etc/httpd/conf.d/mod_security.conf | grep -i SecRuleEngine

# restart apache
service httpd restart


# verify ModSecurity is running
cat /var/log/httpd/error_log


