## create SSL key
## tested in centos 7
## referenece ==> https://linuxize.com/post/creating-a-self-signed-ssl-certificate/

openssl req -newkey rsa \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key
