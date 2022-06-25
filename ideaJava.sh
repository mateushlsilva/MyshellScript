#!/bin/bash

#############################################################################
#									    #
#			Instador de IDEA Java				    #
#									    #
# O script vai instalar o java 17 caso o sistema não possua 		    #
# o java instalado. As idea java possiveis de instalar com o script são	    #
# Intellij Idea Edu, Intellij Community, Netbeans.			    #
#									    #
# Autor: Mateus Silva (mateushls01@gmail.com)				    #
#									    #
# Data Criação: 23/06/2022						    #
#									    #
#############################################################################



java --version 2> /dev/null

if [ $? -gt 0 ]
then
	echo -e "Instalando o java 17!\nIsso vai demorar alguns minutos!"
	sleep 3
	sudo apt install openjdk-17-jdk -y 
	if [ $? -eq 0 ]
	then
		echo "Java 17 instalado com sucesso!"
	else
		echo "Não foi possivel instalar o java 17!"
		exit 1
	fi
else
	echo "Java já esta instalado!"
fi

snap --help > /dev/null
if [ $? -gt 0 ]
then
	echo "Habilitando suporte a snap"; sudo rm /etc/apt/preferences.d/nosnap.pref;sudo apt install snapd -y > /dev/null; sudo apt update -y > /dev/null
fi
sleep 2
clear
echo -e "Qual você deseja instalar?\n[ 1 ] Intellij IDEA Edu\n[ 2 ] Intellij IDEA Community\n[ 3 ] Netbeans"
read -p "Digite aqui: " OPECAO

case $OPECAO in 
	1)
		echo -e "Instalando o intellij idea edu"
		sudo snap install intellij-idea-educational --classic
		;;
	2)
		echo -e "Instalando o intellij community"
		sudo snap install intellij-idea-community --classic
		;;
	3)
		echo -e "Instalando o netbeans"
		cd /home/$(whoami)/Downloads/
		wget -c https://archive.apache.org/dist/netbeans/netbeans-installers/13/Apache-NetBeans-13-bin-linux-x64.sh
		chmod +x Apache-NetBeans-13-bin-linux-x64.sh&&sudo ./Apache-NetBeans-13-bin-linux-x64.sh
		;;
	*)
		echo "Opção invalida!"
		;;
	esac
