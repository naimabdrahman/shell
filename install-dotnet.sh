## Install Microsoft .NET Core 2.0 on centos 7

yum -y install deltarpm unzip zlib gettext libunwind libicu libcurl-devel openssl-devel libicu-devel
rpm --import https://packages.microsoft.com/keys/microsoft.asc

touch  /etc/yum.repos.d/dotnetdev.repo 
echo -e "[packages-microsoft-com-prod]" > /etc/yum.repos.d/dotnetdev.repo
echo -e "name=packages-microsoft-com-prod" >> /etc/yum.repos.d/dotnetdev.repo
echo -e "baseurl=https://packages.microsoft.com/yumrepos/microsoft-rhel7.3-prod" >> /etc/yum.repos.d/dotnetdev.repo
echo -e "enabled=1" >> /etc/yum.repos.d/dotnetdev.repo
echo -e "gpgcheck=1" >> /etc/yum.repos.d/dotnetdev.repo
echo -e "gpgkey=https://packages.microsoft.com/keys/microsoft.asc" >> /etc/yum.repos.d/dotnetdev.repo

yum -y install dotnet-sdk-2.0.0

echo 'export PATH=$PATH:$HOME/dotnet' > /etc/profile.d/dotnetdev.sh
source /etc/profile.d/dotnetdev.sh
dotnet --version

## test 1 dotnet app
#dotnet new console -o helloworld # hash if not used !!!
#cd helloworld ; dotnet run # hash if not used !!! 
#cd # hash if not used !!!


## test 2 dotnet app
#dotnet new razor -o asp.net # hash if not used !!!
#cd asp.net ; dotnet run # hash if not used !!!
#cd # hash if not used !!!


## Note : use ssh tunnel if app is not accessible externally 
