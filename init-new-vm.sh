## New VM init
## tested on centos 7
## password text file is prepared separately prior to running this script

## epel
yum -y install epel-release

## firewall 
service firewalld stop
chkconfig firewalld off

## selinux off
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

## chrony
yum -y install chrony
service chronyd start
chkconfig chronyd on


## establish ssh keys 
cd ~/.ssh ; ssh-keygen -f id_rsa -t rsa -N "" ; sleep 1
yum -y install sshpass ; sleep 1
sshpass -p "`cat /root/password`" ssh-copy-id -o StrictHostKeyChecking=no root@localhost ; sleep 1
cd


## useradd & sudoer
useradd naim
usermod -aG wheel naim
echo "`cat /root/password`"  | passwd --stdin naim


## visudo
sed -i  's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers


## packages
yum -y install vim wget git bind-utils net-tools lsof


## fail2ban
yum -y install fail2ban
service fail2ban start
chkconfig fail2ban on


## PermitRootLogin no  ---> switched on
PERMITROOT=on       ## on or off <Update accordingly>
if test "$PERMITROOT" = "on" 
then 
 cat /etc/ssh/sshd_config > /etc/ssh/sshd_config.bckup.`date +%s`
 sed -i 's/PermitRootLogin yes/PermitRootLogin no/'g /etc/ssh/sshd_config
else 
  echo -e "PERMITROOT is not on"
fi
 

## reload sshd
systemctl reload sshd
 

## remove unwanted files and dir
rm -rf /root/git
rm -rf /root/password


## reboot off
#reboot


## hostname - for cluster mode
#/etc/hosts - for cluster mode 
