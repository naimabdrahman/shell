## install jenkins on centos 7



## install java 
yum -y install java-sdk
#yum -y install java-1.8.0-openjdk
#yum -y install java-1.8.0-openjdk-devel


## prepare jenkins repo
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

## install jenkins and start service permanently
yum -y install jenkins
systemctl start jenkins
systemctl enable jenkins


## firewall config off
FW=off
if test "$FW" = "on" 
then 
    firewall-cmd --permanent --zone=public --add-port=8080/tcp
	firewall-cmd --reload
else 
    echo "FW not on"
fi
