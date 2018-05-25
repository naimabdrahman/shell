## Install minimal GUI on centos 7

yum -y groupinstall "X Window System"
yum -y install gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts
yum -y install firefox

## to boot up in runlevel 5 
#unlink /etc/systemd/system/default.target
#ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target
#reboot


## Install vnc server 
yum -y install tigervnc-server

