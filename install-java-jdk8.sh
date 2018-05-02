# Install JDK 8 on centos 7
# Please manually cleanup if the script is to be rerun again

yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64
sleep 1
echo -e "#########">> /etc/profile
echo -e "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre" >> /etc/profile
echo -e 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo -e 'export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar' >> /etc/profile
echo -e "#########">> /etc/profile
sleep 1

echo -e "pls run >>>> source /etc/profile \nbefore start using java"
