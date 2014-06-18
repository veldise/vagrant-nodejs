#!/bin/sh
echo "- Python Install Start"
py_ver=`python -c 'import sys; print "%s.%s.%s" % sys.version_info[:3]'`
INSTALL_VER="2.7.5"

if [ "${py_ver}" == $INSTALL_VER ]; then
	echo 'alreay Python v'$INSTALL_VER
else
	wget http://www.python.org/ftp/python/$INSTALL_VER/Python-$INSTALL_VER.tgz
	tar xfzp Python-$INSTALL_VER.tgz
	cd Python-$INSTALL_VER
	./configure && make && make install
	cd ..
	rm -rf Python-$INSTALL_VER*
fi
