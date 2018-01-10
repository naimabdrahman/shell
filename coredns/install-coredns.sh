# install coredns on centos 7


# install golang on centos 7 - prerequisuite
# repo is located in https://go-repo.io/
rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | tee /etc/yum.repos.d/go-repo.repo
yum -y install golang
sleep 2



# install coredns 
go get github.com/coredns/coredns
sleep 2
cd /root/go/src/github.com/coredns/coredns/
sleep 2
go build 
sleep 2



# coredns installation completed
echo -e "\ninstallation completed\n"
echo -e "\nto start coredns run ./coredns &\n"
echo -e "\ncreate a proper config file (Corefile) before using it\n"
echo -e "\nURL of coredns https://coredns.io/\n"
echo -e "\nthe github page https://github.com/coredns/coredns\n"
echo -e "\ntemplate config files are included as follows:\n`ls | grep -v install`\n\n"
