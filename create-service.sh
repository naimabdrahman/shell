#create service in centos 7

vars=prometheus

#touch /etc/systemd/system/multi-user.target.wants/$vars.service
touch /etc/systemd/system/$vars.service

echo -e "[Unit]" > /etc/systemd/system/$vars.service
echo -e "Description=$vars server" >> /etc/systemd/system/$vars.service
echo -e "After = network.target " >> /etc/systemd/system/$vars.service
echo -e "">> /etc/systemd/system/$vars.service
echo -e "[Service]" >> /etc/systemd/system/$vars.service
echo -e "User=root">> /etc/systemd/system/$vars.service
echo -e "ExecStart=/root/jmeter/bin/$vars-server" >> /etc/systemd/system/$vars.service  # service 
echo -e "" >> /etc/systemd/system/$vars.service
echo -e "[Install]" >> /etc/systemd/system/$vars.service
echo -e "WantedBy=multi-user.target" >> /etc/systemd/system/$vars.service


## tweak path for multi-user.target.wants (if used)
#mv /etc/systemd/system/multi-user.target.wants/$vars.service /usr/lib/systemd/system/



## enable service
systemctl daemon-reload
systemctl start $vars.service
systemctl enable $vars.service









## additional template below for reference
#[Unit]
#Description=Node Exporter
#
#[Service]
#User=prometheus
#ExecStart=/usr/bin/node_exporter
#
#[Install]
#WantedBy=default.target
