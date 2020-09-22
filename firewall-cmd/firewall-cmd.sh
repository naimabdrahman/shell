##
#firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='116.31.116.21' reject" ; firewall-cmd --reload
for x in `cat blacklist.txt`; do firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='$x' reject" ; done ; firewall-cmd --reload
