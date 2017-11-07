#install nfs server on centos 7

yum -y install nfs-utils
cat /etc/idmapd.conf > /etc/idmapd.conf.bckup
cat /etc/idmapd.conf.bckup | sed 's/#Domain = local.domain.edu/nar.test/g' > /etc/idmapd.conf

mkdir /data
touch /etc/exports
echo "/data 0.0.0.0 (rw,no_root_squash)" > /etc/exports

systemctl start rpcbind nfs-server
systemctl enable rpcbind nfs-server
