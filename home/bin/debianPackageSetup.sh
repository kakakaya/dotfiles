#!/bin/sh
# DO NOT RUN AS ROOT!

# Enable contrib/non-free
sudo sed -i -e "s/main$/main contrib non-free/g" /etc/apt/sources.list

# Install Required? packages
sudo aptitude update
sudo aptitude install\
     zsh ruby terminator rxvt-unicode-256color guake jed byobu most\
     chromium\
     htop python3-pip trash-cli wdiff tig\
     golang\
     colorgcc colortail colormake colordiff source-highlight\
     pcmanfm nautilus-dropbox sshfs tree mupdf\
     xinput xcape awesome-extra arandr\
     ipython ipython3 arp-scan autojump gnuplot-qt\
     nyancat sl tty-clock oneko figlet\
     emacs ddskk skkdic-extra howm\
     node npm
sudo aptitude full-upgrade

# Install with other package management systems.
# sudo easy_install -U pip
# sudo pip install --upgrade pip-tools elpy
# sudo pip-review --auto          # no longer available

sudo npm install marked

# set directory names from japanese to C
LC_ALL=C xdg-user-dirs-update   # --force

# create links
sudo ln -s /usr/bin/nodejs /usr/local/bin/node

#making dir
mkdir -p ~/.fonts ~/tmp ~/mnt ~/git ~/.ssh ~/.local/go

# install peco
GOPATH="$HOME/.local/go" go get github.com/peco/peco/cmd/peco

cat << EOF > .zshenv.local
# -*- Mode: shell-script;coding:utf-8 -*- #

export EMAIL=''
EOF
chsh -s /bin/zsh $USER

# Dropbox init
dropbox start -i

exit 0

# urxvt config
# mkdir -p ~/.urxvt/
# git clone htpps://muennich/urxvt-perls ~/.urxvt/
# cd ~/.urxvt/urxvt-perls/
# chmod u+x url-select
# chmod u+x keyboard-select
# chmod u+x clipboard
# cd

# get catimg.sh
