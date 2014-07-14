#!/bin/sh
echo -e "\n- Python Install Start\n"

python=/usr/local/bin/python
if [ ! -f $python ]; then
	python=python
fi

# python -V (stderr)
py_ver=`$python -c 'import sys; print "%s.%s.%s" % sys.version_info[:3]'`
INSTALL_VER="2.7.8"

if [ "${py_ver}" == $INSTALL_VER ]; then
	echo 'alreay Python v'$INSTALL_VER
else
	if [ -f /vagrant/tgz/Python-$INSTALL_VER.tgz ]; then
		echo "copy file......"
		cp /vagrant/tgz/Python-$INSTALL_VER.tgz .
	else
		echo "download......"
		wget http://www.python.org/ftp/python/$INSTALL_VER/Python-$INSTALL_VER.tgz
	fi

	tar xfzp Python-$INSTALL_VER.tgz
	cd Python-$INSTALL_VER

	echo "configure......"
	./configure &> ../python_configure.log
	echo "make......"
	make &> ../python_make.log
	echo "make install......"
	make install &> ../python_makeinstall.log
	cd ..
	rm -rf Python-$INSTALL_VER*
fi

echo -e "\n- Python Install End\n"
