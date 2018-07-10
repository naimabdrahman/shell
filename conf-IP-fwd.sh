# IP forwarding in centos 7




# Check IP fwd status via sysctl:
sysctl net.ipv4.ip_forward

# Check IP fwd status via /proc/sys/net
cat /proc/sys/net/ipv4/ip_forward





# Enable IP fwd
#sysctl -w net.ipv4.ip_forward=1

# Enable IP fwd permanently
echo "net.ipv4.ip_forward = 1" >> /usr/lib/sysctl.d/50-default.conf
sysctl -p 
#reboot

