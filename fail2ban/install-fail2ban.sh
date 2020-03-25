## install fail2ban - > centos 7

## epel
yum -y install epel-release

## fail2ban
yum -y install fail2ban
service fail2ban start
chkconfig fail2ban on

## fail2ban - customization and service reload - /etc/fail2ban/jail.local
touch /etc/fail2ban/jail.local
curl https://raw.githubusercontent.com/naimabdrahman/shell/master/fail2ban/jail.local > /etc/fail2ban/jail.local 
service fail2ban restart

## verification - notification
echo -e "
to validate fail2ban .. run below

fail2ban-client  status

or

fail2ban-client  status sshd

"
