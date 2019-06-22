## configure enp0s3 to manual IP
## tested with enp0s3 centos 7

nmcli c modify enp0s3 ipv4.addresses 192.168.43.41/24
nmcli c modify enp0s3 ipv4.gateway 192.168.43.1
nmcli c modify enp0s3 ipv4.dns 8.8.8.8
nmcli c modify enp0s3 ipv4.method manual
reboot
