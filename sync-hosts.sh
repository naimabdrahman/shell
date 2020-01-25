## centos 7
## sync /etc/hosts in node1 to node2, node3, node4 

for x in node2 node3 node4 ; do cat /etc/hosts | ssh $x 'cat > /etc/hosts' ; done
