## install flash plugin on centos 7

rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

#yum -y update ## remove hash to install latest version

yum -y install flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl
