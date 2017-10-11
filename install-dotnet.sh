#install dotnet in centos 7
yum -y install deltarpm unzip zlib gettext libunwind libicu libcurl-devel openssl-devel libicu-devel
rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat > /etc/yum.repos.d/dotnetdev.repo <<EOF
[packages-microsoft-com-prod]
name=packages-microsoft-com-prod
baseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF


yum -y install dotnet-sdk-2.0.0
echo 'export PATH=$PATH:$HOME/dotnet' > /etc/profile.d/dotnetdev.sh
source /etc/profile.d/dotnetdev.sh
dotnet --version
