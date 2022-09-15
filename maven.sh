#!/bin/bash

curl --version > /dev/null 2>&1
if [ $? -gt 0 ]
then
	sudo apt install curl -y > /dev/null 2>&1
fi

curl -s "https://get.sdkman.io"| bash > /dev/null 2>&1

sdk install maven 3.8.6 -y > /dev/null 2>&1
if [ $? -gt 0 ]
then
	echo "Feche o terminal e abra outro!\nDepois Execute o Script denovo! "
	exit 2
fi
