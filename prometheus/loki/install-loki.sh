## install loki

## download to /tmp
#wget https://github.com/grafana/loki/releases/download/v2.4.1/loki-linux-amd64.zip -P /tmp/
#wget https://github.com/grafana/loki/releases/download/v3.0.1/loki-linux-amd64.zip -P /tmp/
wget https://github.com/grafana/loki/releases/download/v2.9.7/loki-linux-amd64.zip -P /tmp/
unzip /tmp/loki-linux-amd64.zip -d /tmp/
mv /tmp/loki-linux-amd64 /usr/local/bin/loki


## prep config
mkdir -p /etc/loki
mkdir -p /tmp/loki/index

cat > /etc/loki/local-config.yaml <<EOF
auth_enabled: false

server:
  http_listen_port: 3100

ingester:
  lifecycler:
    address: 127.0.0.1
    ring:
      kvstore:
        store: inmemory
      replication_factor: 1
  chunk_idle_period: 15m

schema_config:
  configs:
    - from: 2020-02-25
      store: boltdb
      object_store: filesystem
      schema: v11
      index:
        prefix: index_
        period: 24h

storage_config:
  boltdb:
    directory: /tmp/loki/index

limits_config:
  enforce_metric_name: false
  reject_old_samples: true
  reject_old_samples_max_age: 168h

chunk_store_config:
  max_look_back_period: 0s
EOF


## create service

cat > /etc/systemd/system/loki.service <<EOF
[Unit]
Description=Loki service
After=network.target

[Service]
ExecStart=/usr/local/bin/loki -config.file /etc/loki/local-config.yaml

[Install]
WantedBy=default.target
EOF

systemctl start loki
systemctl enable loki

