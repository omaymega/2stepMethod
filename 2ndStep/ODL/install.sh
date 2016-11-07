#!/bin/bash
# OpenDaylight Controller

#first install Java JDK and the Apache Maven
sudo apt-get install openjdk-8-jdk
apt-get install maven

#using git to build ODL
sudo apt-get install git
git clone https://git.opendaylight.org/gerrit/integration/distribution

