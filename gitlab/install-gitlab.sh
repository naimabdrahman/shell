## install gitlab ee on centos 7 
## recommended at least 4GB of free RAM

## dependencies

sudo yum install -y curl policycoreutils-python openssh-server
sudo systemctl enable sshd
sudo systemctl start sshd


service firewalld start
chkconfig firewalld on
firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
systemctl reload firewalld


## postfix
sudo yum install postfix
sudo systemctl enable postfix
sudo systemctl start postfix



## Add the GitLab package repository and install the package
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash



## Cert and installation
#sudo EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee
#sudo EXTERNAL_URL="https://IP" yum install -y gitlab-ee
IP=`nmcli  device show | grep -i IP4.ADDRESS | grep -v 127.0.0.1 | grep -v 192.168 | awk -F: '{print $2}' | awk -F \/ '{print $1}' | sed 's/                         //g'`
sudo EXTERNAL_URL="https://$IP" yum install -y gitlab-ee

