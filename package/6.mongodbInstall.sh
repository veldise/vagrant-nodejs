#!/bin/sh
echo -e "\n- MongoDB Install Start\n"

vagrant=/home/vagrant 

mongo_ver=`mongo --version | grep -v git`
INSTALL_VER="2.6.4"

if [ "${mongo_ver}" == "MongoDB shell version: "$INSTALL_VER ]; then
	echo "alreay MongoDB "$INSTALL_VER
else
	echo "Yum Install MongoDB"

	cp /vagrant/package/mongodb.repo /etc/yum.repos.d/mongodb.repo

	cp /vagrant/package/mongodbCreateUser.js mongodbCreateUser.js

	yum install -y mongodb-org-$INSTALL_VER &> mongodb_install.log

	service mongod start

	# create user
	mongo < mongodbCreateUser.js

	service mongod stop

	# modify config
	sed 's/#auth=true/auth=true/' /etc/mongod.conf >> /etc/mongod2.conf
	mv /etc/mongod2.conf /etc/mongod.conf

	/etc/init.d/mongod start

	chkconfig --levels 235 mongod on

	# remove files
	rm mongodbCreateUser.js
fi

echo -e "\n- MongoDB Install End\n"
