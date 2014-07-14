#!/bin/sh
echo -e "\n- Node.js Install Start\n"

node=/usr/local/bin/node
npm=/usr/local/bin/npm

node_ver=`$node -v`
INSTALL_VER="v0.10.29"

if [ "${node_ver}" == $INSTALL_VER ]; then
	echo "alreay Node.js "$INSTALL_VER
else
	if [ -f /vagrant/tgz/node-$INSTALL_VER.tar.gz ]; then
		echo "copy file......"
		cp /vagrant/tgz/node-$INSTALL_VER.tar.gz .
	else
		echo "download......"
		wget http://nodejs.org/dist/$INSTALL_VER/node-$INSTALL_VER.tar.gz
	fi

	tar xfzp node-$INSTALL_VER.tar.gz
	cd node-$INSTALL_VER

	echo "configure......"
	./configure &> ../node_configure.log
	echo "make......"
	make &> ../node_make.log
	echo "make install......"
	make install &> ../node_makeinstall.log
	cd ..
	rm -rf node-$INSTALL_VER*

	echo "- Node packages Install Start"
	$npm install -g async underscore colors express@3.5.0 jade stylus winston protobuf websocket connect multiparty request socket.io &> npmInstall.log

	profile=/etc/profile.d/nodejs.sh
	echo "export NODE_PATH=/usr/local/bin/node:/usr/local/lib/node_modules:" > $profile
	source $profile
fi

echo -e "\n- Node.js Install End\n"
