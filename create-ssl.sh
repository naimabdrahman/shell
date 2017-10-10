cd /etc/pki/tls/certs
make server.key
openssl rsa -in server.key -out server.key
make server.csr
openssl x509 -in server.csr -out server.cert -req -signkey server.key -days 3650
