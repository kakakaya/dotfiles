#!/bin/sh

# Enable contrib/non-free
sed -i -e "s/main$/main contrib non-free/g" /etc/apt/sources.list

# Install Required? packages
apt-get update
apt-get install\
        zsh ruby terminator guake jed byobu most\
        automake autoconf\
        chromium\
        htop python3-setuptools trash-cli wdiff tig\
        golang\
        colorgcc colortail colormake colordiff source-highlight\
        pcmanfm nautilus-dropbox sshfs tree mupdf\
        xinput xcape awesome-extra arandr\
        ipython ipython3 arp-scan autojump gnuplot-qt\
        nyancat sl tty-clock oneko figlet\
        emacs ddskk skkdic-extra howm\
        jq
apt-get upgrade
