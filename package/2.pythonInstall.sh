#!/bin/sh
echo -e "\n- Python Install Start: "`date +%H:%M:%S`"\n"

python=`type -p python`

if [ $python ]; then
	# stderr -> stdout
	py_ver=`$python --version 2>&1`
fi
INSTALL_VER="2.7.9"

if [ "${py_ver}" == "Python "$INSTALL_VER ]; then
	echo 'alreay Python v'$INSTALL_VER
else
	if [ -f /vagrant/tgz/Python-$INSTALL_VER.tgz ]; then
		echo "copy file......"
		cp /vagrant/tgz/Python-$INSTALL_VER.tgz .
	else
		echo "download......"
		wget http://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz &> python_download.log
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

echo -e "\n- Python Install End: "`date +%H:%M:%S`"\n"
