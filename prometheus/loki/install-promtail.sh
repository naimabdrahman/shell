## install loki

## download to /tmp
wget https://github.com/grafana/loki/releases/download/v2.4.1/promtail-linux-amd64.zip -P /tmp/
unzip /tmp/promtail-linux-amd64.zip -d /tmp
mv /tmp/promtail-linux-amd64 /usr/local/bin/promtail


## prep config
mkdir -p /etc/promtail

cat > /etc/promtail/promtail-local-config.yaml << EOF

server:
  http_listen_port: 9080
  grpc_listen_port: 0

positions:
  filename: /tmp/positions.yaml

clients:
  - url: http://localhost:3100/loki/api/v1/push

scrape_configs:
  - job_name: system
    static_configs:
      - targets:
          - localhost
        labels:
          job: varlogs
          __path__: /var/log/*log

  - job_name: nginx
    static_configs:
      - targets:
          - localhost
        labels:
          job: nginx
          __path__: /var/log/nginx/*.log



EOF


## create service

cat > /etc/systemd/system/promtail.service <<EOF

[Unit]
Description=Promtail service
After=network.target

[Service]
ExecStart=/usr/local/bin/promtail -config.file /etc/promtail/promtail-local-config.yaml

[Install]
WantedBy=default.target

EOF

systemctl start promtail
systemctl enable promtail

