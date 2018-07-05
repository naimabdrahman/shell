## install fluentd service on centos 7
curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent3.sh | sh
systemctl start td-agent.service
chkconfig td-agent on
service td-agent status
sleep 3




## test to log data 
curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test

## validate data logged
cat /var/log/td-agent/td-agent.log


## install plugins for bigquery
#td-agent-gem install fluent-plugin-bigquery -v 2.0.0.beta

