# gfs installation for seamless ssh centos 7 cluster
# list is made of all available hosts (currently tested for 3 hosts) # file (list) should have been made available
# this is for replication config
# iptables and selinux disabled 


# skipping below for disk creation
#    mkfs.xfs -i size=512 /dev/sdb1
#    mkdir -p /data/brick1
#    echo '/dev/sdb1 /data/brick1 xfs defaults 1 2' >> /etc/fstab
#    mount -a && mount



# using below for disk creation
#for x in `cat list` ; do ssh $x 'mkdir /data' ; done
for x in `cat list` ; do ssh $x 'mkdir -p /data/brickgv1' ; done


# install gluster
#for x in `cat list` ; do ssh $x 'yum -y install centos-release-gluster312.noarch' ; done # version 3.12
for x in `cat list` ; do ssh $x 'yum -y install centos-release-gluster' ; done # latest version from The CentOS Storage Special Interest Group (SIG)
for x in `cat list` ; do ssh $x 'yum -y install glusterfs-server' ; done

for x in `cat list` ; do ssh $x 'service glusterd start' ; done
for x in `cat list` ; do ssh $x 'chkconfig glusterd on' ; done
for x in `cat list` ; do ssh $x 'service glusterd status' ; done

ssh node1 'gluster peer probe node2'
ssh node1 'gluster peer probe node3'

ssh node2 'gluster peer probe node1'
ssh node2 'gluster peer probe node3'

ssh node3 'gluster peer probe node1'
ssh node3 'gluster peer probe node2'

for x in `cat list` ; do ssh $x 'gluster peer status' ; done


## Set up a GlusterFS volume ==> 3 replicas are used

#gluster volume create gv1 replica 3 node1:/data/brick1/gv1 node2:/data/brick1/gv1 node3:/data/brick1/gv1 force #3 replicas
gluster volume create gv1 replica 3 node1:/data/brickgv1 node2:/data/brickgv1 node3:/data/brickgv1 force #3 replicas

#gluster volume create gv1 replica 3 arbiter 1 node1:/data/brick1/gv1 node2:/data/brick1/gv1 node3:/data/brick1/gv1 force #3 replicas (with 1 arbiter)
#gluster volume create gv1 replica 3 arbiter 1 node1:/data/brickgv1 node2:/data/brickgv1 node3:/data/brickgv1 force #3 replicas (with 1 arbiter)

gluster volume start gv1
gluster volume info

## Testing / client setting # Remove the comment out to use the test
#mkdir /mnt/temp
#mount -t glusterfs node1:/gv1 /mnt/temp
#for ((x=1; x<100; x++)) ; do touch /mnt/temp/file$x ; done # creating files
#for x in `cat list` ; do ssh $x 'ls /data/brickgv1' ; done # checking if files exist in other hosts 
#echo -e "\n\nPls unmount and remove /mnt/temp after the test\n\n"


## To add failover to glusterfs, add entry below in a client fstab (/etc/fstab) without the '#'
#node1:/gv1 /mnt/temp glusterfs defaults,_netdev,backupvolfile-server=node2,log-level=WARNING,log-file=/var/log/gluster.log 0 0



