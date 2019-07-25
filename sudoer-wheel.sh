## allows sudoer power for wheel group 
## tested on centos 7


# create temp file 
mkdir -p /root/temp
cd /root/temp


# create sudoer backup if not available
if test -f /root/temp/sudoers.bckup
then echo -e "file /root/temp/sudoers.bckup exist\nproceeding with sudoer changes"
else cat /etc/sudoers > /root/temp/sudoers.bckup 
fi


# make changes to sudoer file (remove comment out on wheel)
sed -i  's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers


# to comment out wheel again (NOT USED)
#sed -i 's/^\%wheel/# & /g' /etc/sudoers



# verify sudoer file
echo -e "\n\n###################### result ########################"
cat /etc/sudoers | grep -i wheel

