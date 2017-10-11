#!/bin/sh
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Tue Oct 20 17:08:36 2015

if [ ! $(dropbox status) = "最新の状態" ]; then
    echo "Run this script after Dropbox's sync end."
    exit
fi

# Make symbolic link
ln -s $HOME/Dropbox/howm $HOME         # For later
ln -s $HOME/Dropbox/Workspace $HOME
ln -s $HOME/Dropbox/Study $HOME
ln -s $HOME/Dropbox/Work $HOME

# ssh config
ln -s ~/Dropbox/config/ssh/config ~/.ssh/config
cp ~/Dropbox/config/ssh/id_ed25519* ~/.ssh/
chmod 600 ~/.ssh/*

# Install fonts
mkdir -p $HOME/.fonts
cp $HOME/Dropbox/config/fonts/*.otf $HOME/Dropbox/config/fonts/*.ttf $HOME/.fonts/
fc-cache ~/.fonts

# Install jlisting.sty
sudo cp ~/Dropbox/config/latex/jlisting.sty /usr/share/texlive/texmf-dist/tex/latex/listings/
sudo mktexlsr
