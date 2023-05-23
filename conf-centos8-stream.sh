## ref: https://nts.strzibny.name/migrating-centos-to-centos-stream-8/
## Migrating CentOS 8 to CentOS Stream 8


yum -y install centos-release-stream
dnf -y distro-sync
cat /etc/redhat-release

## https://techglimpse.com/failed-metadata-repo-appstream-centos-8/
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
