## install snap
yum install -y snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
sleep 3
sudo snap install core; sudo snap refresh core
