# install awx on centos 7

# Install EPEL repository

# Disable firewall and SELinux

# Install docker CE
yum -y update
yum remove docker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum makecache fast
yum -y install docker-ce
service docker start
chkconfig docker on
yum -y install python-pip
pip install docker-compose

# Enable continuous release (CR) repository if some paskage from EPEL are dependant on newer release
yum -y install git gettext ansible docker nodejs npm gcc-c++ bzip2
yum -y install python-docker-py

# Additional pip installation of urllib3 pyOpenSSL
pip install requests urllib3 pyOpenSSL --force --upgrade

# Restart docker service
service docker restart


# Install ansible
yum --enablerepo=epel -y install ansible openssh-clients 
cat /etc/ansible/ansible.cfg  > /etc/ansible/ansible.cfg.bckup
cat /etc/ansible/ansible.cfg.bckup | sed 's/#host_key_checking = False/host_key_checking = False/g' > /etc/ansible/ansible.cfg

cat /etc/ansible/hosts > /etc/ansible/hosts.bckup
echo -e "[local]" > /etc/ansible/hosts
echo -e "localhost ansible_connection=ssh ansible_ssh_user=root ansible_ssh_pass=<INSERT>" >> /etc/ansible/hosts
echo -e "\n\npls add passord in /etc/ansible/hosts before using it\n\n "


# Clone repository and deploy (it will take about 20 minutes)
yum -y install git
mkdir /root/git
cd /root/git
git clone https://github.com/ansible/awx.git
cd /root/git/awx/installer/
ansible-playbook -i inventory install.yml

# Monitor migrations status (it will take about 10 minutes)
#docker logs -f awx_task # log monitoring disabled 

# Verify the application
echo -e "\n\nNow you can access AWX web server http://localhost:80"
echo -e "\nThe default administrator username is admin and the password is password\n\n"
