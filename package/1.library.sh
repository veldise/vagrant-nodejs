#!/bin/sh
echo -e "\n- Utilities or Library Install Start: "`date +%H:%M:%S`"\n"

echo "linux package install......"
yum -y install wget make gcc gcc-c++ bzip2-devel openssl-devel git vim &> library.log

# make ~/.gitconfig
echo "- set Git global config"
confPath='/home/vagrant/.gitconfig'
cp /vagrant/package/gitconfig $confPath
chown vagrant:vagrant $confPath
chmod 644 $confPath

echo -e "\n- Utilities or Library Install End: "`date +%H:%M:%S`"\n"
