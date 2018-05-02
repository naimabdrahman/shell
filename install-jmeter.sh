# Step 1 - install java 1.8
yum -y install java-1.8.0-openjdk.x86_64

# Step 2 - install jmeter 3.2
curl https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.tgz > $HOME/apache-jmeter-3.2.tgz
tar -xvzf $HOME/apache-jmeter-3.2.tgz
ln -s $HOME/apache-jmeter-3.2 $HOME/jmeter

# Step 3 - add to your path in ~/.bashrc
echo "export JMETER_HOME=$HOME/jmeter" >> /root/.bashrc
echo "export PATH=$PATH:$JMETER_HOME/bin" >> /root/.bashrc
source  /root/.bashrc

# Step 4 - install jmeter plugin manager
curl -L https://jmeter-plugins.org/get/ > $HOME/jmeter/lib/ext/plugins-manager.jar
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.0/cmdrunner-2.0.jar > $HOME/jmeter/lib/cmdrunner-2.0.jar
java -cp $HOME/jmeter/lib/ext/plugins-manager.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# Step 5 - install plugins via plugin manager
# jpgc-autostop
# jpgc-casutg
# jpgc-csl
# jpgc-dummy
# jpgc-ffw
# jpgc-filterresults
# jpgc-functions
# jpgc-json
# jpgc-mergeresults
# jpgc-prmctl
# jpgc-sense
# jpgc-tst
# jpgc-wsc

./apache-jmeter-3.2/bin/PluginsManagerCMD.sh install jpgc-autostop,jpgc-casutg,jpgc-csl,jpgc-dummy,jpgc-ffw,jpgc-filterresults,jpgc-functions,jpgc-json,jpgc-mergeresults,jpgc-prmctl,jpgc-sense,jpgc-tst,jpgc-wsc


# Step 6 - start jmeter-server # not started 
#$HOME/jmeter/bin/jmeter-server

# Optional - install Maven
curl http://ftp.wayne.edu/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.2-bin.tar.gz > $HOME/apache-maven-3.5.2-bin.tar.gz
tar -xvzf $HOME/apache-maven-3.5.2-bin.tar.gz
ln -s $HOME/apache-maven-3.5.2 $HOME/maven

# In .bashrc
echo "export M2_HOME=$HOME/maven" >>  /root/.bashrc
echo "export PATH=$PATH:$M2_HOME/bin" >>  /root/.bashrc
source /root/.bashrc


