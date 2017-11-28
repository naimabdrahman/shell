# to run standalone prometheus service in centos 7
# this script should be placed in the prometheus working dir

for x in `ps  -ef | grep prom | grep -v grep  | awk '{print $2}'` ; do kill -9 $x ; done
./prometheus --config.file=prometheus.yml &
