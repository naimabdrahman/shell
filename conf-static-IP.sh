# Servarl methods to configure static IP in centos 7
# please either use option 1 or option 2 below

# option 1
# nmtui # UI for centos 7 network configuration

# or

# option 2 
# modifying existing interface # adjust accordingly
nmcli c modify eth0 ipv4.addresses 10.0.0.30/24   # set static IP  
nmcli c modify eth0 ipv4.gateway 10.0.0.1         # set gateway
nmcli c modify eth0 ipv4.dns 10.0.0.1             # set DNS
nmcli c modify eth0 ipv4.method manual            # set manual for static setting (it's "auto" for DHCP)
nmcli c down eth0; nmcli c up eth0                # restart the interface and reload the settings



############################################################################################
                                    ### template ###
############################################################################################
#DEVICE=ethX
#BOOTPROTO=none
#IPV4_FAILURE_FATAL=no
#IPV6INIT=yes
#IPV6_AUTOCONF=yes
#IPV6_DEFROUTE=yes
#IPV6_FAILURE_FATAL=no
#NAME=ethX
#ONBOOT=yes
#IPADDR=192.168.1.50
#PREFIX=24
#GATEWAY=192.168.1.254
#DNS1=192.168.1.254 # optinal
#IPV6_PEERDNS=yes
#IPV6_PEERROUTES=yes
############################################################################################
############################################################################################
