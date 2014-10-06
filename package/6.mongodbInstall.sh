#!/bin/sh
echo -e "\n- MongoDB Install Start\n"

mongod=$HOME/mongodb/bin/mongod

mongo_ver=`$mongod --version | grep -v git`
INSTALL_VER="2.6.4"

if [ "${mongo_ver}" == "db version v"$INSTALL_VER ]; then
	echo "alreay MongoDB "$INSTALL_VER
else
	if [ -f /vagrant/tgz/mongodb-linux-x86_64-$INSTALL_VER.tgz ]; then
		echo "copy file......"
		cp /vagrant/tgz/mongodb-linux-x86_64-$INSTALL_VER.tgz .
	else
		echo "download......"
		wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$INSTALL_VER.tgz
	fi

	tar xfzp mongodb-linux-x86_64-$INSTALL_VER.tgz

	mv mongodb-linux-x86_64-$INSTALL_VER $HOME/mongodb
	mkdir -p $HOME/mongodb/data/db
	mkdir -p $HOME/mongodb/data/log
	rm -rf mongodb-linux-x86_64-$INSTALL_VER*

	cp /vagrant/package/mongodb* $HOME/mongodb/.
	chown vagrant:vagrant $HOME/mongodb/mongodb*
	chmod 644 $HOME/mongodb/mongodb*

	export PATH=$HOME/mongodb/bin:$PATH

	# run server
	mongod --config $HOME/mongodb/mongodb.conf
	# create users (admin, mobigen)
	mongo < $HOME/mongodb/mongodbCreateUser.js
fi

echo -e "\n- MongoDB Install End\n"
