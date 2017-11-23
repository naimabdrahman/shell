#install nfs client on centos 7

yum -y install nfs-utils
cat /etc/idmapd.conf > /etc/idmapd.conf.bckup
cat /etc/idmapd.conf.bckup | sed 's/#Domain = local.domain.edu/nar.test/g' > /etc/idmapd.conf

systemctl start rpcbind
systemctl enable rpcbind

mkdir /mnt/temp
mount -t nfs node1.nar.test:/data /mnt/temp  ##host can be replaced with IP

df -hT

echo "node1.nar.test:/data  /mnt/temp                   nfs     defaults        0 0 " >>/etc/fstab
