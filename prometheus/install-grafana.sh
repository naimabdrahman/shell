## install grafana on centos 8

touch /etc/yum.repos.d/grafana.repo
cat > /etc/yum.repos.d/grafana.repo <<EOL
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOL


#touch /etc/yum.repos.d/grafana.repo
#echo -e "[grafana]" >> /etc/yum.repos.d/grafana.repo
#echo -e "name=grafana" >> /etc/yum.repos.d/grafana.repo
#echo -e "baseurl=https://packages.grafana.com/oss/rpm" >> /etc/yum.repos.d/grafana.repo
#echo -e "repo_gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
#echo -e "enabled=1" >> /etc/yum.repos.d/grafana.repo
#echo -e "gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
#echo -e "gpgkey=https://packages.grafana.com/gpg.key" >> /etc/yum.repos.d/grafana.repo
#echo -e "sslverify=1" >> /etc/yum.repos.d/grafana.repo
#echo -e "sslcacert=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/yum.repos.d/grafana.repo


yum -y install grafana
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
systemctl enable  grafana-server

echo -e "\n\npls login to http://IP:3000"
echo -e "\nu adm p adm\n\n"

## obsolete repos
#touch /etc/yum.repos.d/grafana.repo
#echo "[grafana]" >> /etc/yum.repos.d/grafana.repo
#echo "name=grafana" >> /etc/yum.repos.d/grafana.repo
#echo -e "baseurl=https://packagecloud.io/grafana/stable/el/6/\$basearch" >> /etc/yum.repos.d/grafana.repo
#echo "repo_gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
#echo "enabled=1" >> /etc/yum.repos.d/grafana.repo
#echo "gpgcheck=1" >> /etc/yum.repos.d/grafana.repo
#echo -e "gpgkey=https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana" >> /etc/yum.repos.d/grafana.repo
#echo "sslverify=1" >> /etc/yum.repos.d/grafana.repo
#echo "sslcacert=/etc/pki/tls/certs/ca-bundle.crt" >> /etc/yum.repos.d/grafana.repo
