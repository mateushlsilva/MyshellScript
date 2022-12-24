#!/bin/bash

update(){
    sudo apt update -y; sudo apt upgrade -y
}

install(){
    sudo apt install $* -y
}

deb(){
    mkdir -p ~/Downloads/deb
    cd ~/Downloads/deb
    Deb=(
        "https://code.visualstudio.com/docs/?dv=linux64_deb
        https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website
        https://download.virtualbox.org/virtualbox/7.0.4/virtualbox-7.0_7.0.4-154605~Ubuntu~jammy_amd64.deb
        https://discord.com/api/download?platform=linux&format=deb
        https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb
        https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-dbgsym_8.0.31-1ubuntu22.04_amd64.deb"
    )
    for i in ${Deb[*]}
    do
        wget -c $i
    done
    sudo dpkg -i *.deb
    sudo apt install -f
}

docker(){
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
}

powerline(){
    sudo mkdir /usr/local/bin/powerline
    sudo git clone https://github.com/powerline/powerline.git /usr/local/bin/powerline/
    sudo wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O /usr/share/fonts/PowerlineSymbols.otf
    sudo wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O /etc/fonts/conf.d/10-powerline-symbols.conf
    echo '. /usr/local/bin/powerline/powerline/bindings/bash/powerline.sh' >> ~/.bashrc
}

dracula(){
    sudo apt-get install dconf-cli
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh
}


jetbrains(){
    cd /opt
    sudo wget -c https://www.jetbrains.com/pt-br/idea/download/download-thanks.html?platform=linux&code=IIC
}

themesIcon(){
    cd ~
    mkdir .themes .icons
    cd .themes
    sudo wget -c https://ppload-com.s3.eu-central-1.amazonaws.com/data/files/1533954207/Sweet-Dark-v40.tar.xz?response-content-disposition=attachment%3B%2520Sweet-Dark-v40.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATLQUPBWASZL2ZPWI%2F20221224%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221224T125701Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=d5ab3406c4d422769af14dd21c2e5914962a7715a6f0f48e7c98c5352ac09009
    sudo tar -xf Sweet-Dark-v40.tar.xz
    cd ../.icons
    sudo wget -c https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1557776257/candy-icons.tar.xz?response-content-disposition=attachment%3B%2520candy-icons.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221224%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221224T130233Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=c40685dd59f1cf33ca4ea1e17f32cd58a2df08cf21f2a2a76dcf554871a8ab52
    sudo tar -xf *.tar.xz
}

update
deb
update

install git nodejs npm vlc gimp gnome-tweaks curl kubectl mysql-server

docker
update

jetbrains
themesIcon

powerline
dracula
