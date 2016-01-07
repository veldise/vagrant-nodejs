#!/bin/sh
echo -e "\n- Node.js Install Start: "`date +%H:%M:%S`"\n"

node=`type -p node`
npm=`type -p npm`

if [ $node ]; then
	node_ver=`$node -v`
fi
INSTALL_VER="v4.2.4"

if [ "${node_ver}" == $INSTALL_VER ]; then
	echo "alreay Node.js "$INSTALL_VER
else
	if [ -f /vagrant/tgz/node-$INSTALL_VER-linux-x64.tar.gz ]; then
		echo "copy file......"
		cp /vagrant/tgz/node-$INSTALL_VER-linux-x64.tar.gz .
	else
		echo "download......"
		wget http://nodejs.org/dist/$INSTALL_VER/node-$INSTALL_VER-linux-x64.tar.gz &> node_download.log
	fi

	# binary install
	CURR_PATH=`pwd`
	cd /usr/local
	tar --strip-components 1 -xzf $CURR_PATH/node-$INSTALL_VER-linux-x64.tar.gz
	cd $CURR_PATH

	# intall node_modules (created: 2015-01-07)
	if [ -f /vagrant/tgz/node_modules.tgz ]; then
		echo "unpack node_modules......"
		cd /usr/local/lib
		tar -xzf /vagrant/tgz/node_modules.tgz
		cd $CURR_PATH
	fi

	# remove install files
	rm -rf node-$INSTALL_VER*

	echo "- Node packages Install Start"
	# utilify
	$npm install -g lodash async colors pm2 grunt grunt-cli requirejs &> npmInstall.log
	# for express
	$npm install -g express@~3.5.x jade less less-middleware multiparty connect cookie &> npmInstall.log
	# for web-platform
	$npm install -g winston mongoose@~3.8.24 request socket.io@~1.2.1 websocket &> npmInstall.log

	profile=/etc/profile.d/nodejs.sh
	echo "export NODE_PATH=/usr/local/bin/node:/usr/local/lib/node_modules:" > $profile
	source $profile
fi

echo -e "\n- Node.js Install End: "`date +%H:%M:%S`"\n"
