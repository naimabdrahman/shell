## install chrome/chromium centos7
## reference : https://geekflare.com/install-chromium-ubuntu-centos/


## chrome installation
cat > /etc/yum.repos.d/google-chrome.repo <<EOL
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOL

yum install -y google-chrome-stable


## chromium installation
#dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
yum -y install chromium*


## validation rendering testing 
#google-chrome-stable --headless --disable-gpu --no-sandbox --print-to-pdf https://gf.dev/

## google-chrome-stable
#google-chrome-stable --headless --disable-gpu --print-to-pdf https://gf.dev/


## no proxy
#chromium-browser --headless --disable-gpu --print-to-pdf https://gf.dev/


## with proxy
#chromium-browser --proxy-server=http://192.168.94.10:8286 --headless --disable-gpu --print-to-pdf https://gf.dev/

