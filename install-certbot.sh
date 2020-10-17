## install snap
yum install -y snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
sudo snap install core; sudo snap refresh core

## certbot - remove old
yum -y remove certbot


## certbot - install new
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot renew --dry-run
