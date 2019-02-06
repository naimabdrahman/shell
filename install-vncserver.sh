## install vnc on centos 7


yum -y install tigervnc-server


# If Firewalld is running, allow VNC service.
firewall-cmd --add-service=vnc-server --permanent
firewall-cmd --reload


