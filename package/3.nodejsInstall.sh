#!/bin/sh
echo "- Node.js Install Start"
node_ver=`node -v`
INSTALL_VER="v0.10.29"

if [ "${node_ver}" == $INSTALL_VER ]; then
	echo "alreay Node.js "$INSTALL_VER
else
	wget http://nodejs.org/dist/$INSTALL_VER/node-$INSTALL_VER.tar.gz
	tar xfzp node-$INSTALL_VER.tar.gz
	cd node-$INSTALL_VER
	./configure && make && make install
	cd ..
	rm -rf node-$INSTALL_VER*

	echo "- Node packages Install Start"
	npm install -g async underscore colors
	npm install -g express jade stylus
	npm install -g winston protobuf websocket connect multiparty request

	profile=/etc/profile.d/nodejs.sh
	echo "export NODE_PATH=/usr/local/bin/node:/usr/local/lib/node_modules:" > $profile
	source $profile
fi
