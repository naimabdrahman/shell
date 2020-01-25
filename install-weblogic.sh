## install Oracle Weblogic Centos 7
## WIP

## install java jdk ##

## install java - supereasy
#sudo yum -y install java-sdk

## install java - easy
#sudo yum -y install java-1.8.0-openjdk
#sudo yum -y install java-1.8.0-openjdk-devel

## install java - easy 11
sudo yum -y install java-11-openjdk java-11-openjdk-devel

## install java - customized
#echo -e " pls download jdk-8u131-linux-x64.rpm "


## configure path
cat >> /home/naim/.bash_profile << EOL
export ORACLE_BASE=/home/naim/wls/oracle 
export ORACLE_HOME=$ORACLE_BASE/product/fmw12 
export MW_HOME=$ORACLE_HOME 
export WLS_HOME=$MW_HOME/wlserver 
export WL_HOME=$WLS_HOME 
export DOMAIN_BASE=$ORACLE_BASE/config/domains 
export DOMAIN_HOME=$DOMAIN_BASE/TEST 
EOL

mkdir -p $ORACLE_BASE 
mkdir -p $DOMAIN_BASE 
mkdir -p $ORACLE_HOME 
mkdir -p $ORACLE_BASE/config/applications 
mkdir -p ~/wls/oraInventory 


cat > /home/naim/wls/oraInst.loc << EOL
inventory_loc=/home/naim/wls/oraInventory 
inst_group=naim
EOL

cat > /home/naim/wls/wls.rsp << EOL
[ENGINE] 
Response File Version=1.0.0.0.0 
[GENERIC] 
ORACLE_HOME=/home/naim/wls/oracle/product/fmw12 
INSTALL_TYPE=WebLogic Server 
DECLINE_SECURITY_UPDATES=true 
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false
EOL

## DL weblogic from Oracle Page
## username && password is required to dl 


## installation /
java -jar /home/naim/wls/oracle/fmw_12.1.3.0.0_wls.jar -silent -responseFile /home/naim/wls/wls.rsp -invPtrLoc /home/naim/wls/oraInst.loc

