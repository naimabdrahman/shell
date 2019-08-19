yum history | grep ID -b2 | awk '{print $2}' | tail -n 1 > /root/yumhistorylatest.txt
