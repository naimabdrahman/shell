## sysbench on centos 7
## benchmarking server


## CPU benchmark
#sysbench --test=cpu --cpu-max-prime=20000 run
sysbench --test=cpu run


## Memory (read)
sysbench --test=memory run

## Memory (write)
sysbench --test=memory --memory-oper=write run


## File IO Benchmark
#sysbench --test=fileio --file-total-size=2G prepare
#sysbench --test=fileio --file-total-size=2G cleanup # to cleanup

## File IO Benchmark
sysbench --test=fileio prepare
sysbench --test=fileio --file-test-mode=rndrw run
sysbench --test=fileio cleanup

## MySQL Benchmark
#sysbench --test=oltp --oltp-table-size=1000000 --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword prepare
#sysbench --test=oltp --oltp-table-size=1000000 --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword --max-time=60 --oltp-read-only=on --max-requests=0 --num-threads=8 run
#sysbench --test=oltp --db-driver=mysql --mysql-db=test --mysql-user=root --mysql-password=yourrootsqlpassword cleanup

## MySQL Benchmark with OLTP 
#mysql -uroot -e "CREATE DATABASE sbtest;"
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root prepare
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root run
#sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root cleanup

