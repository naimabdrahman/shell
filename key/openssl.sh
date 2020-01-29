## create SSL key
## tested in centos 7
## referenece ==> https://linuxize.com/post/creating-a-self-signed-ssl-certificate/



## manual => switched off
#openssl req -newkey rsa \
#            -x509 \
#            -sha256 \
#            -days 3650 \
#            -nodes \
#            -out example.crt \
#            -keyout example.key



## manual => switched on
openssl req -newkey rsa \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key \
            -subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=www.example.com"

