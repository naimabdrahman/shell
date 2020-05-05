## sysbench on centos 7
## benchmarking server


## installation on centos7
yum -y install sysbench



## CPU benchmark

# with option
sysbench cpu --cpu-max-prime=20000 run

#optionless
sysbench cpu run





## Memory (read)
sysbench memory run

## Memory (write)
sysbench memory --memory-oper=write run





## File IO Benchmark - make sure the tested size is bigger than the ram

# optionless
sysbench fileio prepare
sysbench fileio --file-test-mode=rndrw run
sysbench fileio cleanup

# with option
sysbench fileio --file-total-size=5G --file-test-mode=rndrw --time=300 --max-requests=0 prepare
sysbench fileio --file-total-size=5G --file-test-mode=rndrw --time=300 --max-requests=0 run
sysbench fileio --file-total-size=5G --file-test-mode=rndrw --time=300 --max-requests=0 cleanup





## MySQL Benchmark with OLTP 
## db named foo is created and --mysql-socket=<mysql.sock path> is not included (using standard port) 

# prepare
sysbench --db-driver=mysql --mysql-user=root --mysql-password=password \
  --mysql-db=foo --range_size=100 \
  --table_size=10000 --tables=2 --threads=1 --events=0 --time=60 \
  --rand-type=uniform /usr/share/sysbench/oltp_read_only.lua prepare

# run
sysbench --db-driver=mysql --mysql-user=root --mysql-password=password \
  --mysql-db=foo --range_size=100 \
  --table_size=10000 --tables=2 --threads=1 --events=0 --time=60 \
  --rand-type=uniform /usr/share/sysbench/oltp_read_only.lua run


## MySQL Benchmark - deprecated
#sysbench --test=oltp --oltp-table-size=1000000 --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword prepare
#sysbench --test=oltp --oltp-table-size=1000000 --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword --max-time=60 --oltp-read-only=on --max-requests=0 --num-threads=8 run
#sysbench --test=oltp --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword cleanup

## MySQL Benchmark with OLTP - deprecated
#mysql -uroot -e "CREATE DATABASE sbtest;"
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root prepare
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root run
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root cleanup



