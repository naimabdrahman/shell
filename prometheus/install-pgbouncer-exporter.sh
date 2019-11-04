## Install pgbouncer exporter
## tested on ubuntu 18.04
## Original steps from https://github.com/spreaker/prometheus-pgbouncer-exporter

## preparation : prepare config file
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

## option 1 : docker ==> switched on
## reference : https://github.com/spreaker/prometheus-pgbouncer-exporter
func_pgb_opt1(){
  
  #docker run --net=host -dit spreaker/prometheus-pgbouncer-exporter
  docker run --net=host -v /opt/pgbouncer_exporter/config.yml:/etc/pgbouncer-exporter/config.yml -dit spreaker/prometheus-pgbouncer-exporter
}
func_pgb_opt1


## option2 : switched off
## reference : https://github.com/spreaker/prometheus-pgbouncer-exporter
func_pgb_opt2(){
  ## try to do this in venv
  pip3 install prometheus-pgbouncer-exporter
  pgbouncer-exporter --config /opt/pgbouncer_exporter/config.yml
}


## option3 : switched off
## this is only for ubuntu os!!!

func_pgb_opt3(){
  wget https://www.cbaines.net/projects/prometheus-pgbouncer-exporter/releases/prometheus-pgbouncer-exporter_1.2_all.deb
  dpkg -i prometheus-pgbouncer-exporter_1.2_all.deb
  apt --fix-broken install
  dpkg -i prometheus-pgbouncer-exporter_1.2_all.deb

  systemctl start prometheus-pgbouncer-exporter.service
  systemctl enable prometheus-pgbouncer-exporter.service
}


## service



## firewall
