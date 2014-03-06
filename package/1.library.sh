#!/bin/sh
echo "- Utilities or Library Install Start"
yum -y install wget make gcc gcc-c++ bzip2-devel openssl-devel git

echo "- set Git global config"
confPath=/home/vagrant/.gitconfig
cp /vagrant/package/gitconfig $confPath
chown vagrant:vagrant $confPath
chmod 644 $confPath
