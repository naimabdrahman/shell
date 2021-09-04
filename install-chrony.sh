## install chrony on centos 7
## fw is off and selinux is off

# install & setup service
yum -y install chrony 
service chronyd start
chkconfig chronyd on


# checking services & sync manually
#chronyc tracking
#chronyc sources
#chronyc -a 'burst 4/4'
#chronyc -a makestep
