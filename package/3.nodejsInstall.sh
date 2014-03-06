#!/bin/sh
echo "- Node.js Install Start"
node_ver=`node -v`
if [ "${node_ver}" == "v0.10.26" ]; then
	echo "alreay Node.js v0.10.26"
else
	wget http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
	tar xfzp node-v0.10.26.tar.gz
	cd node-v0.10.26
	./configure && make && make install
	cd ..
	rm -rf node-v0.10.26*

	echo "- Node packages Install Start"
	npm install -g async underscore colors
	npm install -g express jade stylus
	npm install -g winston protobuf websocket connect multiparty request

	profile=/etc/profile.d/nodejs.sh
	echo "export NODE_PATH=/usr/local/bin/node:/usr/local/lib/node_modules:" > $profile
	source $profile
fi
