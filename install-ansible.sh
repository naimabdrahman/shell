## install ansible on centos 7


## preparation
yum -y install epel-release

## installation + configuration of /etc/ansible/ansible.cfg
yum --enablerepo=epel -y install ansible openssh-clients 
cat /etc/ansible/ansible.cfg  > /etc/ansible/ansible.cfg.bckup
cat /etc/ansible/ansible.cfg.bckup | sed 's/#host_key_checking = False/host_key_checking = False/g' > /etc/ansible/ansible.cfg


## configuration of /etc/ansible/hosts
cat /etc/ansible/hosts > /etc/ansible/hosts.bckup
echo -e "[local]" > /etc/ansible/hosts
echo -e "localhost ansible_connection=ssh ansible_ssh_user=root ansible_ssh_pass=<INSERT>" >> /etc/ansible/hosts
echo -e "\n\npls add passord in /etc/ansible/hosts before using it\n\n "

