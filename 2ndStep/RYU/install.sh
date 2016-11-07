#!/bin/sh
# Check Permission
# test $(id -u) -ne 0 && echo "This script must be run as root" && exit 0

total_memory=$(free -b | grep 'Mem' | awk '{print $2}')
minimum_memory=512000
test $total_memory -lt $minimum_memory && echo "Minimum memory requirement is 512MB" && exit 0

# Get the latest package lists
sudo apt-get update
sudo apt-get install -y --force-yes git python-pip python3-pip build-essential python-dev python3-dev

git clone --depth 1 https://github.com/osrg/ryu.git
# Upgrade pip
sudo pip install pip six --upgrade

sudo pip install -r ryu/tools/pip-requires

cd ryu; sudo python ./setup.py install
