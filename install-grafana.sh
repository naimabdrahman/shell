#install grafana on centos 7

touch /etc/yum.repos.d/grafana.repo
echo "[grafana]" >> /etc/yum.repos.d/grafana.repo
echo "name=grafana" >> /etc/yum.repos.d/grafana.repo
echo -e "baseurl=https://packagecloud.io/grafana/stable/el/6/\$basearch" >> /etc/yum.repos.d/grafana.repo
echo "repo_gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
echo "enabled=1" >> /etc/yum.repos.d/grafana.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
echo -e "gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana" >> /etc/yum.repos.d/grafana.repo
echo "sslverify=1" >> /etc/yum.repos.d/grafana.repo
echo "sslcacert=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/yum.repos.d/grafana.repo

yum -y install grafana
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
systemctl enable  grafana-server

echo -e "\n\npls login to http://IP:3000"
echo -e "\nu adm p adm\n\n"
