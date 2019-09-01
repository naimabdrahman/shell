## create ssl 

## option 1 
cd /etc/pki/tls/certs
make server.key
openssl rsa -in server.key -out server.key
make server.csr
openssl x509 -in server.csr -out server.cert -req -signkey server.key -days 3650


## option 2
#cd /etc/pki/tls/certs
#openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/pki/tls/certs/haproxy.pem -out /etc/pki/tls/certs/haproxy.pem -days 3650 
