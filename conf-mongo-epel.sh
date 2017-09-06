#this script is used specifically for mongodb centos 7 downloaded from epel repo
#MongoDB shell version: 2.6.12
#to configure /etc/mongod.conf



# create backup and tempfile

if test -f /etc/mongod.conf.bckup ; then echo -e "/etc/mongod.conf.bckup exist"; else cat /etc/mongod.conf > /etc/mongod.conf.bckup; fi
if test -f temp2.txt ; then echo -e "temp2.txt exist"; else cat /etc/mongod.conf > temp2.txt; fi
#cat /etc/mongod.conf > /etc/mongod.conf.bckup
#cat /etc/mongod.conf > temp2.txt


#IP
nmcli  | grep inet4 | awk  '{print $2}' | awk -F\/ '{print $1}'





#editing configuration of /etc/mongod.conf 
#replace bind_ip
cat temp2.txt  | sed -e 's/#port = 27017/port = 27017/g' | sed -e 's/#keyFile = arg/keyFile = \/opt\/mongo\/mongo-keyfile/g' | sed -e 's/#replSet = arg/replSet = rs0/g' | sed -e 's/bind_ip = 127.0.0.1/bind_ip = 127.0.0.1,$IP/g'> temp3.txt
cat temp3.txt > /etc/mongod.conf
