## install syncthing centos7

## setting up repo
scp -rp /root/git/shell/syncthing/syncthing.repo /etc/yum.repos.d/syncthing.repo
yum repolist


## installation
yum -y install screen
yum -y install syncthing


