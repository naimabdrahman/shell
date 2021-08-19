## ref ==> https://howtoprogram.xyz/2016/08/28/install-spring-boot-command-line-interface-on-linux/


## open jdk 8 # commente out
#yum -y install java-sdk

## open jdk 11
yum -y install java-11-openjdk.x86_64 java-11-openjdk-demo.x86_64 java-11-openjdk-devel.x86_64 java-11-openjdk-headless.x86_64 java-11-openjdk-javadoc.x86_64 java-11-openjdk-src.x86_64 java-11-openjdk-static-libs.x86_64


## spring version 
wget http://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.4.0.RELEASE/spring-boot-cli-1.4.0.RELEASE-bin.tar.gz

mkdir /opt/spring-boot
tar -zxvf spring-boot-cli-1.4.0.RELEASE-bin.tar.gz -C /opt/spring-boot


echo "export SPRING_HOME=/opt/spring-boot/spring-1.4.0.RELEASE" >> /etc/profile
echo "export PATH=\$SPRING_HOME/bin:\$PATH " >> /etc/profile

source /etc/profile
