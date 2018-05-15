#create service in centos 7

touch /etc/systemd/system/multi-user.target.wants/lalala.service

echo -e "[Unit]" > /etc/systemd/system/lalala.service
echo -e "Description=lalala server" >> /etc/systemd/system/lalala.service
echo -e "After = network.target " >> /etc/systemd/system/lalala.service
echo -e "">> /etc/systemd/system/lalala.service
echo -e "[Service]" >> /etc/systemd/system/lalala.service
echo -e "User=root">> /etc/systemd/system/lalala.service
echo -e "ExecStart=/root/jmeter/bin/lalala-server" >> /etc/systemd/system/lalala.service
echo -e "" >> /etc/systemd/system/lalala.service
echo -e "[Install]" >> /etc/systemd/system/lalala.service
echo -e "WantedBy=default.target" >> /etc/systemd/system/lalala.service

systemctl start lalala.service
systemctl enable lalala.service
