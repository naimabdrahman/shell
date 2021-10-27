## install latest nodejs on centos
## ref ==> https://tecadmin.net/install-latest-nodejs-and-npm-on-centos/

## 16
yum install -y gcc-c++ make 
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash - 
yum -y install nodejs

## 14
#yum install -y gcc-c++ make 
#curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash - 
#yum -y install nodejs




## optional

cat > ~/demo_server.js <<EOF

var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Welcome Node.js');
}).listen(3001, "127.0.0.1");
console.log('Server running at http://127.0.0.1:3001/');

EOF

echo -e "

run \"node ~/demo_server.js\" for test
or 
run \"node --inspect demo_server.js\" for test

"
