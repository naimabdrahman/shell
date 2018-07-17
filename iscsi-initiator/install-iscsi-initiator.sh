# Install / configure iSCSI Initiator on centos 7
# Requires IQN before start !!!
# Requires sdb information before start !!!
# Requires iSCSI target IP address !!!

yum -y install iscsi-initiator-utils 


# Change to the same IQN you set on the iSCSI target server
cat /etc/iscsi/initiatorname.iscsi > /etc/iscsi/initiatorname.iscsi.bckup
echo "InitiatorName=iqn.2006-01.com.openfiler:tsn.a8fc6b40e48a" > /etc/iscsi/initiatorname.iscsi  # update this line for each new installation !!!



# Configure line 57,61,62 of /etc/iscsi/iscsid.conf about CHAP, username, password
cat /etc/iscsi/iscsid.conf > /etc/iscsi/iscsid.conf.bckup
sed -i -e 's/#node.session.auth.authmethod = CHAP/node.session.auth.authmethod = CHAP/g' /etc/iscsi/iscsid.conf
sed -i -e 's/#node.session.auth.username = username/node.session.auth.username = username/g' /etc/iscsi/iscsid.conf
sed -i -e 's/#node.session.auth.password = password/node.session.auth.password = password/g' /etc/iscsi/iscsid.conf

# Or 
#cat /root/git/shell/iscsi-initiator/iscsid.conf.template > /etc/iscsi/iscsid.conf


# Discover target 
iscsiadm -m discovery -t sendtargets -p 10.0.0.30 # Update iSCSI target IP address !!!


# Confirm status after discovery
iscsiadm -m node -o show 

# Login to the target
iscsiadm -m node --login 

# Confirm the established session
iscsiadm -m session -o show 

# Confirm the partitions
cat /proc/partitions 


# Added new device provided from the target server as "sdb" # Update the sdb information !!!
# Create label
parted --script /dev/sdb "mklabel msdos" 

# Create partiton
parted --script /dev/sdb "mkpart primary 0% 100%"

# Format with XFS
mkfs.xfs -i size=1024 -s size=4096 /dev/sdb1 

# Mount it on "mnt"
mount /dev/sdb1 /mnt

#Verify mount
df -hT  

# Configure fstab
cat /etc/fstab > /etc/fstab.bckup
echo -e  "/dev/sdb1       /mnt            xfs     _netdev         0       0" >> /etc/fstab

# Installation complete
echo -e "installation completed"


  
