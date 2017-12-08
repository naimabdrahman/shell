# install go (go1.9.2.linux-amd64.tar.gz) on centos 7
# package go1.9.2.linux-amd64.tar.gz can be updated from time to time

yum -y install wget

mkdir /root/golang
cd /root/golang
wget https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz
sleep 1
tar -zxvf *.tar.gz
sleep 1


###################################################################################################
### select permanent or temporary ###

### permanent path update ###

#echo -e '\n' >>  >>/root/.bashrc
#echo -e '### GO ###' >>/root/.bashrc
#echo -e 'export GOROOT=$HOME/golang/go' >>/root/.bashrc
#echo -e 'export PATH=$PATH:$GOROOT/bin' >>/root/.bashrc
#sleep 1
#source /root/.bashrc

### temporary path update ###
export GOROOT=$HOME/golang/go ; export PATH=$PATH:$GOROOT/bin ; source /root/.bashrc ; export GOPATH=/root/go ; source /root/.bashrc

###################################################################################################

sleep 1 
go version
go env
