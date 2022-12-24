#!/bin/bash

read -p "Nome do programa: ex:Pycharm-community " NOME
read -p "Caminho do arquivo de execução: " EXE
read -p "Caminho do icone do programa: " ICO


touch /home/mateus/'Área de Trabalho'/$NOME.desktop
chmod +x /home/mateus/'Área de Trabalho'/$NOME.desktop

echo -e " [Desktop Entry]
Name=$NOME
Type=Application
Exec=$EXE
Icon=$ICO " >> /home/mateus/'Área de Trabalho'/$NOME.desktop


