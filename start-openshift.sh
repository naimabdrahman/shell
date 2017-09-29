systemctl daemon-reload
systemctl start openshift
chkconfig openshift on
sleep 2

#export KUBECONFIG=/opt/openshift/openshift.local.config/master/admin.kubeconfig
#export CURL_CA_BUNDLE=/opt/openshift/openshift.local.config/master/ca.crt
source /root/.bashrc
sleep 2

oc login -u system:admin
sleep 2

oadm policy add-scc-to-user hostnetwork -z router
oadm router
oadm registry
sleep 2
echo -e "Browse to https://127.0.0.1:8443 in your web browser" 
