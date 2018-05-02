# configure eth0 to manual IP
nmcli c modify eth0 ipv4.addresses 192.168.x.x/24
nmcli c modify eth0 ipv4.gateway 192.168.x.x
nmcli c modify eth0 ipv4.dns 8.8.8.8
nmcli c modify eth0 ipv4.method manual
reboot
