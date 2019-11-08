## Oracle DB exporter
docker run  --net=host -dit --rm -e DATA_SOURCE_NAME=system/password@localhost iamseth/oracledb_exporter

#docker run  --net=host -dit --rm -e DATA_SOURCE_NAME=system/password@localhost:1521 iamseth/oracledb_exporter ## with port number


## verification

echo -e "

To check , pls run below
curl http://IP:9161/metrics | grep -i oracledb_up

"

