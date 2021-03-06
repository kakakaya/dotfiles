#!/bin/bash
# Install minimum required packages

if [[ $(id -u) -ne 0 ]]; then
    echo "Run as root"
    exit
fi

# apt
apt update
apt install -y\
    git tig\
    zsh jed byobu most\
    automake autoconf\
    curl\
    htop python3-setuptools python3-pip trash-cli wdiff\
    golang ruby\
    colortail colormake colordiff source-highlight\
    sshfs tree\
    figlet\
    jq

apt full-upgrade -y

# Python
# pip
easy_install3 pip
pip install -U pip virtualenv

# npm
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt install -y nodejs
npm install -g marked tern html
