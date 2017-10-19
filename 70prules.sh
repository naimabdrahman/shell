#checking eth0
eth0=`cat /etc/udev/rules.d/70-persistent-net.rules | grep eth0 | wc -l`
 
 
#delete 70-persistent-net.rules if eth0 not equal to 1. will reboot after deleting
if [ $eth0 -ne 1 ]
then
rm -rf /etc/udev/rules.d/70-persistent-net.rules && reboot
fi
 
 
#checking number of eth
eth=`cat /etc/udev/rules.d/70-persistent-net.rules | grep eth | wc -l`
 
#delete 70-persistent-net.rules if eth not equal to 1. will reboot after deleting
if [ $eth -ne 1 ]
then
rm -rf /etc/udev/rules.d/70-persistent-net.rules && reboot
fi
