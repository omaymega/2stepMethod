#!/bin/bash
#a script to install cbnch tool

#install dependencies
sudo apt-get install autoconf automake libtool libsnmp-dev libpcap-dev

#configure OpenFlow
sudo git clone git://gitosis.stanford.edu/openflow.git
cd openflow
sudo git checkout -b mybranch origin/release/1.0.0
cd..

#configure oflops
sudo git clone git://gitosis.stanford.edu/oflops.git
cd oflops
sudo git submodule init
sudo git submodule update
cd ..

#configure libconfig
sudo wget http://www.hyperrealm.com/libconfig/libconfig-1.4.9.tar.gzsudo tar -xvzf libconfig-1.4.9.tar.gz
cd libconfig-1.4.9
sudo ./configure
sudo make
sudo make install
cd ../oflops/netfpga-packet-generator-c-library/
sudo ./autogen.sh
sudo ./configure
sudo make
cd ..
sudo sh ./boot.sh
sudo ./configure --with-openflow-src-dir=<openflow-source-file>

#final step
sudo make
sudo make install
cd cbench
