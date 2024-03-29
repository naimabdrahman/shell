## create SSL key
## tested in centos 8
## referenece ==> https://linuxize.com/post/creating-a-self-signed-ssl-certificate/



## manual => switched off
#openssl req -newkey rsa \
#            -x509 \
#            -sha256 \
#            -days 3650 \
#            -nodes \
#            -out example.crt \
#            -keyout example.key



## auto => switched on
openssl req -newkey rsa \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key \
            -subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=www.example.com"


## auto 2 => switched off
#openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=nginxsvc/O=nginxsvc"
