#!/bin/sh
echo "- Protobuf Install Start"
pb_ver=`protoc --version`
if [ "${pb_ver}" == "libprotoc 2.5.0" ]; then
	echo "alreay Protobuf v2.5.0"
else
	wget https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz
	tar xfzp protobuf-2.5.0.tar.gz
	cd protobuf-2.5.0
	./configure && make && make install
	cd ..
	rm -rf protobuf-2.5.0*
fi
