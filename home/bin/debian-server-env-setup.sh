#!/bin/sh
# Install Required? packages

# Enable contrib/non-free
sed -i -e "s/main$/main contrib non-free/g" /etc/apt/sources.list

apt-get update
apt-get install\
     zsh ruby jed byobu most\
     htop python3-pip trash-cli wdiff tig\
     golang\
     colorgcc colortail colormake colordiff source-highlight\
     sshfs tree\
     ipython3 arp-scan autojump\
     nyancat sl tty-clock figlet\
     jq

apt-get upgrade
