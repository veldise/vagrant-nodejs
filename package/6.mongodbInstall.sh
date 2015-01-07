#!/bin/sh
echo -e "\n- MongoDB Install Start\n"

vagrant=/home/vagrant 

mongo_ver=`mongo --version | grep -v git`
INSTALL_VER="2.6.6"

if [ "${mongo_ver}" == "MongoDB shell version: "$INSTALL_VER ]; then
	echo "alreay MongoDB "$INSTALL_VER
else
	echo "Yum Install MongoDB"

	# copy files
	cp /vagrant/package/mongodb.repo /etc/yum.repos.d/mongodb.repo
	cp /vagrant/package/mongodbCreateUser.js mongodbCreateUser.js

	yum install -y mongodb-org-$INSTALL_VER &> mongodb_install.log

	# run DB
	service mongod start

	# create user
	mongo < mongodbCreateUser.js

	# stop DB & modify config
	service mongod stop
	sed 's/#auth=true/auth=true/' /etc/mongod.conf >> /etc/mongod.conf.tmp
	mv /etc/mongod.conf.tmp /etc/mongod.conf

	# restart DB
	/etc/init.d/mongod start

	# register chkconfig (Launch DB when VM booting)
	chkconfig --levels 235 mongod on

	# remove files
	rm mongodbCreateUser.js
fi

echo -e "\n- MongoDB Install End\n"
