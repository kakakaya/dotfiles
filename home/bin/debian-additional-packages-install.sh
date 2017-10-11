#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "Run as root"
    exit
fi

# Enable contrib/non-free
sed -i -e "s/main$/main contrib non-free/g" /etc/apt/sources.list

# apt
apt update
apt install -y\
    terminator\
    chromium\
    pcmanfm nautilus-dropbox mupdf\
    xdg-user-dirs-gtk xinput xcape awesome-extra arandr\
    ipython ipython3 arp-scan autojump\
    nyancat sl tty-clock oneko\
    fortunes fortunes-debian-hints\
    emacs ddskk skkdic-extra howm\
    jq

apt full-upgrade -y
