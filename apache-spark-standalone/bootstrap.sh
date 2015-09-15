#!/bin/bash

apt-get purge openjdk*
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get -y install software-properties-common
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y install oracle-java8-installer

cd /tmp 
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.0-bin-hadoop2.6.tgz
cd /home/vagrant
tar -zxf /tmp/spark-1.5.0-bin-hadoop2.6.tgz

echo "Done. Try: "
echo "  vagrant ssh"
echo "  cd spark-1.5.0-bin-hadoop2.6"
echo "  ./bin/pyspark"
echo '  testFile = sc.textFile("README.md")'
echo '  testFile.count()'
echo "  CTRL+D to exit"