## install chrome

cat > /etc/yum.repos.d/google-chrome.repo <<EOL
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOL

yum install -y google-chrome-stable

## install chromium
#dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
#yum -y install chromium*



## install nodejs and validate
yum install -y nodejs gcc gcc-c++
node -v 
npm -v


## install remaining packages
yum -y install libXcomposite libXdamage libXtst cups libXScrnSaver pango atk adwaita-cursor-theme adwaita-icon-theme at at-spi2-atk at-spi2-core cairo-gobject colord-libs dconf desktop-file-utils ed emacs-filesystem gdk-pixbuf2 glib-networking gnutls gsettings-desktop-schemas gtk-update-icon-cache gtk3 hicolor-icon-theme jasper-libs json-glib libappindicator-gtk3 libdbusmenu libdbusmenu-gtk3 libepoxy liberation-fonts liberation-narrow-fonts liberation-sans-fonts liberation-serif-fonts libgusb libindicator-gtk3 libmodman libproxy libsoup libwayland-cursor libwayland-egl libxkbcommon m4 mailx nettle patch psmisc redhat-lsb-core redhat-lsb-submod-security rest spax time trousers xdg-utils xkeyboard-config


##  grafana-cli
grafana-cli plugins install grafana-image-renderer


