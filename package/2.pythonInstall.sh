#!/bin/sh
echo "- Python Install Start"
py_ver=`python -c 'import sys; print "%s.%s.%s" % sys.version_info[:3]'`

if [ "${py_ver}" == "2.7.5" ]; then
	echo 'alreay Python v2.7.5'
else
	wget http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
	tar xfzp Python-2.7.5.tgz
	cd Python-2.7.5
	./configure && make && make install
	cd ..
	rm -rf Python-2.7.5*
fi
