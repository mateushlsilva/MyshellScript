#!/bin/bash

sudo apt update;sudo apt upgrade

sudo apt install git -y
sudo apt install openjdk-17-jdk -y 
sudo apt install nodejs -y
sudo apt install npm -y

cd ~/Downloads/;mkdir arquivosDeb; cd ~/arquivosDeb

wget -c https://code.visualstudio.com/docs/?dv=linux64_deb
wget -c https://archive.apache.org/dist/netbeans/netbeans-installers/13/Apache-NetBeans-13-bin-linux-x64.sh
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb
wget -c https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.30-1ubuntu22.04_amd64.deb

sudo dpkg -i *.deb

sudo apt install mysql-server
