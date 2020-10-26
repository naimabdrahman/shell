## install snap
yum install -y snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
sudo snap install core; sudo snap refresh core
