#this script is used specifically for mongodb centos 7 for mongodb-org-3.4
#MongoDB shell version: mongodb-org-3.4
#to configure /etc/mongod.conf

# create backup and tempfile

if test -f /etc/mongod.conf.bckup ; then echo -e "/etc/mongod.conf.bckup exist"; else cat /etc/mongod.conf > /etc/mongod.conf.bckup; fi
if test -f temp2.txt ; then echo -e "temp2.txt exist"; else cat /etc/mongod.conf > temp2.txt; fi
#cat /etc/mongod.conf > /etc/mongod.conf.bckup
#cat /etc/mongod.conf > temp2.txt


#IP
#IP=`nmcli| grep inet4 | awk  '{print $2}' | awk -F\/ '{print $1}'`
#echo $IP





#editing configuration of /etc/mongod.conf
#bind_ip is not replaced

echo -e "security:" >> /etc/mongod.conf
echo -e "  keyFile: /opt/mongo/mongo-keyfile" >> /etc/mongod.conf

echo -e "" >> /etc/mongod.conf

echo -e "replication:" >> /etc/mongod.conf
echo -e "  replSetName: rs0" >> /etc/mongod.conf
