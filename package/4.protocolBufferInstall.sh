#!/bin/sh
echo "- Protobuf Install Start"
pb_ver=`protoc --version`
INSTALL_VER="2.5.0"

if [ "${pb_ver}" == "libprotoc "$INSTALL_VER ]; then
	echo "alreay Protobuf v"$INSTALL_VER
else
	wget https://protobuf.googlecode.com/files/protobuf-$INSTALL_VER.tar.gz
	tar xfzp protobuf-$INSTALL_VER.tar.gz
	cd protobuf-$INSTALL_VER
	./configure && make && make install
	cd ..
	rm -rf protobuf-$INSTALL_VER*
fi
