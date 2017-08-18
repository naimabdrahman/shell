nmcli c add type bridge autoconnect yes con-name br0 ifname br0
nmcli c modify br0 ipv4.addresses 192.168.1.67/24 ipv4.method manual
nmcli c modify br0 ipv4.gateway 192.168.1.254
nmcli c modify br0 ipv4.dns 192.168.1.254
nmcli c delete enp5s0
nmcli c add type bridge-slave autoconnect yes con-name enp5s0 ifname enp5s0 master br0
reboot
