#!/bin/sh
echo -e "\n- MongoDB Install Start: "`date +%H:%M:%S`"\n"

mongo=`type -p mongo`

if [ $mongo ]; then
	mongo_ver=`$mongo --version`
fi
INSTALL_VER="2.6.6"

if [ "${mongo_ver}" == "MongoDB shell version: "$INSTALL_VER ]; then
	echo "alreay MongoDB: "$INSTALL_VER
else
	echo "install(yum) MongoDB..."

	# copy files
	cp /vagrant/package/mongodb.repo /etc/yum.repos.d/mongodb.repo

	yum install -y mongodb-org-$INSTALL_VER &> mongodb_install.log

	# run DB
	service mongod start

	# create user
	mongo < /vagrant/package/mongodbCreateUser.js

	# stop DB & modify config
	service mongod stop
	sed -i 's/#auth=true/auth=true/' /etc/mongod.conf

	# restart DB
	/etc/init.d/mongod start

	# register chkconfig (Launch DB when VM booting)
	chkconfig --levels 235 mongod on
fi

echo -e "\n- MongoDB Install End: "`date +%H:%M:%S`"\n"
