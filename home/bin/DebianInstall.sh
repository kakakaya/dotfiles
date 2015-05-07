#!/bin/sh
# DO NOT RUN AS ROOT!

# Enable contrib/non-free
sudo sed -i -e "s/main$/main contrib non-free/g" /etc/apt/sources.list

# Install Required? packages
sudo aptitude update
sudo aptitude full-upgrade
sudo aptitude install\
     zsh git ruby terminator rxvt-unicode-256color guake byobu\
     most jed\
     viewnior\
     chromium\
     python-pip trash-cli wdiff tig\
     colorgcc colortail colormake colordiff\
     pcmanfm nautilus-dropbox sshfs tree mupdf\
     xinput xcape awesome-extra arandr\
     htop apt-spy ipython arp-scan autojump gnuplot-qt\
     nyancat sl tty-clock oneko figlet\
     emacs ddskk skkdic-extra howm magit yatex\
     silversearcher-ag-el auto-complete-el emacs-goodies-el migemo-el

sudo pip install pip-tools elpy

# configure
LC_ALL=C xdg-user-dirs-gtk-update --force
chsh -s /bin/zsh kakakaya

#making dir
mkdir -p ~/.fonts
mkdir -p ~/tmp
mkdir -p ~/mnt

exit 0

# Dropbox init
dropbox start -i

# ln -s Dropbox/Backups/config/.skk-jisyo .skk-jisyo
# ln -s Dropbox/howm howm         # For later

## ssh
mkdir .ssh
# ssh-keygen -t rsa

#urxvt config
# mkdir -p ~/.urxvt/
# git clone htpps://muennich/urxvt-perls ~/.urxvt/
# cd ~/.urxvt/urxvt-perls/
# chmod u+x url-select
# chmod u+x keyboard-select
# chmod u+x clipboard
# cd

## Emacs
# mkdir -p ~/.emacs.d/elisp
# wget http://www.emacswiki.org/emacs/download/auto-install.el ~/.emacs.d/elisp
# emacs --batch -Q -f batch-byte-compile ~/.emacs.d/elisp/auto-install.el

# git clone https://github.com/emacs-helm/helm ~/.emacs.d/
# cd ~/.emacs.d/helm && make && cd


## Emacs memo
# cd ~/tmp && git clone https://github.com/zk-phi/sublimity && cd
# wget 'https://sites.google.com/site/rtfreesoft/font-drop/mona-izmg16.7z' # mona font

# get catimg.sh

## must package-install:
# main-line
# markdown-mode
# highlight-symbol
# auto-highlight-symbol
# undo-tree
# flex-autopair
# anzu
# f
# hlinum
# volatile-highlights
# lua-mode
# js2-mode
# coffee-mode
# twittering-mode
# elpy
# emmet-mode


## emacswiki:




# Unknown
# (require 'dired-x )		;diredを便利にする
# (require 'wdired )			;diredから"r"でファイル名をインライン編集
# (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
# (require 'wgrep-helm )		;M-x grepする、*grep*バッファでC-c C-pすると書き換わる
# (setq dired-listing-switches "-AFGhlrt")
# (require 'flyspell nil t) ;スペルチェック、要設定重点

# (require 'markdown-mode nil t)
# (setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
# (setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

