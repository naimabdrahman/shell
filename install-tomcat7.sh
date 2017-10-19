#script to install tomcat 7 on centos 7

yum -y install tomcat
cat /usr/share/tomcat/conf/tomcat.conf > /usr/share/tomcat/conf/tomcat.conf.bckup
echo 'JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"' >> /usr/share/tomcat/conf/tomcat.conf
yum -y install tomcat-webapps tomcat-admin-webapps 
yum -y install tomcat-docs-webapp tomcat-javadoc

cat /usr/share/tomcat/conf/tomcat-users.xml > /usr/share/tomcat/conf/tomcat-users.xml.bckup
echo '<tomcat-users>' > /usr/share/tomcat/conf/tomcat-users.xml
echo '    <user username="admin" password="password" roles="manager-gui,admin-gui"/>' >> /usr/share/tomcat/conf/tomcat-users.xml
echo '</tomcat-users>' >> /usr/share/tomcat/conf/tomcat-users.xml


systemctl restart tomcat
chkconfig tomcat on

echo "Pls login to http://server_IP_address:8080"
echo "or"
echo "Pls http://server_IP_address:8080/manager/html:"
