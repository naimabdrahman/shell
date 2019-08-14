## etup kvm on centos 7 

yum -y install qemu-kvm libvirt virt-install bridge-utils
systemctl start libvirtd
systemctl enable libvirtd 
yum -y install virt-manager 

echo -e "\n\n\Setup br0 and kvm is available"
