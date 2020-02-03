## install syncthing centos7



## setting up repo option1
#scp -rp syncthing.repo /etc/yum.repos.d/syncthing.repo

## setting up repo option2 
cat > /etc/yum.repos.d/syncthing.repo <<EOL
[copr:copr.fedorainfracloud.org:daftaupe:syncthing]
name=Copr repo for syncthing owned by daftaupe
baseurl=https://copr-be.cloud.fedoraproject.org/results/daftaupe/syncthing/epel-7-\$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/daftaupe/syncthing/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
EOL


yum repolist


## installation
yum -y install screen
yum -y install syncthing
