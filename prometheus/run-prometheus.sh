## to run standalone prometheus service in centos 7
## this script should be execute in the prometheus working dir (option 1) or anywhere (option 2) 

for x in `ps  -ef | grep prom | grep -v grep  | awk '{print $2}'` ; do kill -9 $x ; done

## execute in working dir (option 1) 
#./prometheus --config.file=prometheus.yml & #run in working dir

## execute anywhere (option 2)  
/root/prometheus-2.0.0.linux-amd64/prometheus --config.file=/root/prometheus-2.0.0.linux-amd64/prometheus.yml & #execute anywhere
