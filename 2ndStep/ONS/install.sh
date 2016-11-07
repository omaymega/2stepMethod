#!/bin/bash

sudo mkdir /usr/lib/jvm
sudo tar zxvf jdk-8u91-linux-x64.tar.gz -C /usr/lib/jvm
cd /usr/lib/jvm
sudo mv jdk1.8.0_91 java
sudo vi ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
source ~/.bashrc
sudo apt-get install git
cd
git clone https://gerrit.onosproject.org/onos
sudo vi /etc/profile

export ONOS_ROOT=~/onos
source $ONOS_ROOT/tools/dev/bash_profile

source /etc/profile

$cd;
$mkdir Applications
$cd Downloads
$wget http://archive.apache.org/dist/karaf/3.0.5/apache-karaf-3.0.5.tar.gz
$wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.g
tar -zxvf apache-karaf-3.0.5.tar.gz -C ../Applications/
tar -zxvf apache-maven-3.3.9-bin.tar.gz -C ../Applications/
sudo vi /etc/profile
export PATH=${KARAF_ROOT}/bin:$PATH 
source /etc/profile

cd ~/onos
mvn clean install -DskipTests
