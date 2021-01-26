## ref: https://nts.strzibny.name/migrating-centos-to-centos-stream-8/
## Migrating CentOS 8 to CentOS Stream 8

yum -y install centos-release-stream
dnf -y distro-sync
cat /etc/redhat-release
