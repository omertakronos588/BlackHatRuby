#!/bin/bash
# Install VSCode on Ubuntu

#dpkg -i code_*.deb
#apt install -f

apt update -y
apt upgrade -y

apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

apt install code
