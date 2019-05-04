## configure eth0 to manual IP
## tested with enp0s3 centos 7

nmcli c modify eth0 ipv4.addresses 192.168.x.x/24
nmcli c modify eth0 ipv4.gateway 192.168.x.x
nmcli c modify eth0 ipv4.dns 8.8.8.8
nmcli c modify eth0 ipv4.method manual
reboot
