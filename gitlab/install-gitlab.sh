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



## Cert 
#sudo EXTERNAL_URL="https://gitlab.example.com" yum install -y gitlab-ee
#sudo EXTERNAL_URL="https://172.105.118.185" yum install -y gitlab-ee


