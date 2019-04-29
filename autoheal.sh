## script to maintain health of container at port 8082
## to restart container if 8082 timeout more than 5 secs
## interval 10 mins (600sec)
## best configured as a service

while true;
 do curl -m 5 http://localhost:8082 #5 sec testing !!!
 if test $? -ne 0; then docker restart <CONTAINER ID> ; else echo -e "fine" >> /dev/null ; fi  # update <CONTAINER ID> !!!
 sleep 600 #600 sec interval !!!
done



