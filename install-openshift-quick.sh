hostnamectl set-hostname openshift.nar.test
yum -y install docker wget vim
echo "INSECURE_REGISTRY='--insecure-registry 172.30.0.0/16'" >>/etc/sysconfig/docker
service docker restart
chkconfig docker on
echo "127.0.0.1   openshift.nar.test openshift" >> /etc/hosts
cd /tmp
wget https://github.com/openshift/origin/releases/download/v1.3.0/openshift-origin-server-v1.3.0-3ab7af3d097b57f933eccef684a714f2368804e7-linux-64bit.tar.gz
tar xf openshift-origin-server-*.tar.gz
cd openshift-origin-server-*
mv k* o* /usr/local/sbin/
cd

touch /usr/local/bin/start_openshift.sh
echo -e "#!/bin/bash" >> /usr/local/bin/start_openshift.sh
echo -e "cd /opt/openshift/" >> /usr/local/bin/start_openshift.sh
echo -e "openshift start --public-master='https://127.0.0.1:8443' --master='https://127.0.0.1:8443'" >> /usr/local/bin/start_openshift.sh


touch /etc/systemd/system/openshift.service
echo -e "[Unit]" >> /etc/systemd/system/openshift.service
echo -e "Description=OpenShift Origin Server" >> /etc/systemd/system/openshift.service
echo -e "" >> /etc/systemd/system/openshift.service
echo -e "[Service]" >> /etc/systemd/system/openshift.service
echo -e "Type=simple" >> /etc/systemd/system/openshift.service
echo -e "ExecStart=/usr/local/bin/start_openshift.sh" >> /etc/systemd/system/openshift.service

chmod u+x /usr/local/bin/start_openshift.sh
mkdir /opt/openshift/
systemctl daemon-reload
systemctl start openshift


echo -e "export KUBECONFIG=/opt/openshift/openshift.local.config/master/admin.kubeconfig" >> /root/.bashrc
echo -e "export CURL_CA_BUNDLE=/opt/openshift/openshift.local.config/master/ca.crt" >> /root/.bashrc

source /root/.bashrc
sleep 2
reboot

#oc login -u system:admin
#oadm policy add-scc-to-user hostnetwork -z router
#oadm router
#oadm registry

echo -e "Browse to https://127.0.0.1:8443 in your web browser"
