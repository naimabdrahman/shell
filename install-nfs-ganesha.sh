## install ganesha & ganesha-gluster
## gluster has to be installed & configure prior to run this script


## ganesha installation
yum -y install centos-release-nfs-ganesha
yum -y install nfs-ganesha-gluster
yum -y install nfs-ganesha-gluster




## configure ganesha
cat /etc/ganesha/ganesha.conf > /etc/ganesha/ganesha.conf.bckup.`date +%s` 

cat > /etc/ganesha/ganesha.conf <<EOL
EXPORT{
        Export_Id = 1;

        Path = /gv1;

        Pseudo = /lalala;

        Protocols = 3,4;

        Access_Type = RW;

        Squash = No_root_squash;

        Sectype = sys;

        FSAL {
                Name = GLUSTER;
                hostname = 192.168.166.162;
                volume = gv1 ;
        }
}


EOL


systemctl start nfs-ganesha ; systemctl enable nfs-ganesha



## nfs utils
yum -y install nfs-utils




## validation 
showmount -e localhost
echo -e "

to test mount =>  mount -t nfs4 test1local:/ /mnt


"
