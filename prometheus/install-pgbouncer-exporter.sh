## Install pgbouncer exporter
## tested on ubuntu 18.04
## Original steps from https://github.com/spreaker/prometheus-pgbouncer-exporter




## preparation - option 2 ##

## option 1
#apt-get update ; apt-get -y install python3-pip  

## option 2
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python3 get-pip.py --user




## installation
pip3 install prometheus-pgbouncer-exporter

## config file 
mkdir -p /opt/pgbouncer_exporter
touch /opt/pgbouncer_exporter/config.yml
cat > /opt/pgbouncer_exporter/config.yml << EOL
# The host on which the exporter should listen to (defaults to 127.0.0.1)
exporter_host: 0.0.0.0

# The port on which the exporter should listen to (defaults to 9100)
exporter_port: 9797

# The list of pgbouncer instances to monitor
pgbouncers:
  -
    # The pgbouncer connection string. Supports environment variables replacement
    # Ie. $(PGBOUNCER_PASS) is replaced with the content of "PGBOUNCER_PASS" environment
    #     variable if exist, or left untouched if doesn't exist
    dsn: postgresql://pgbouncer:$(PGBOUNCER_PASS)@localhost:6431/pgbouncer

    # The pgbouncer connection timeout in seconds (defaults to 5 seconds)
    connect_timeout: 5

    # Databases to report metrics for. If omitted or empty, all databases
    # will be reported.
    include_databases:

    # Databases to exclude from metrics reporting. If omitted or empty, all
    # databases matching "include_databases" will be reported.
    exclude_databases:
      - pgbouncer

    # Extra labels to add to all metrics exported for this pgbouncer
    # instance. Required if you have configured multiple pgbouncers,
    # in order to export an unique set of metrics.
    extra_labels:
      pool_id: 1

  - dsn: postgresql://pgbouncer:$(PGBOUNCER_PASS)@localhost:6432/pgbouncer
    exclude_databases:
      - pgbouncer
    extra_labels:
      pool_id: 2
EOL


## quick run
#pgbouncer-exporter --config ./config.yml
pgbouncer-exporter --config /opt/pgbouncer_exporter/config.yml


## service



## firewall
