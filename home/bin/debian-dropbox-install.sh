#!/bin/sh
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Tue Oct 20 17:08:36 2015

if [ ! $(dropbox status) = 最新の状態 ]; then
    echo "Run this script after Dropbox's sync end!"
    return 1;
fi

# Make symbolic link
ln -s $HOME/Dropbox/howm $HOME         # For later
ln -s $HOME/Dropbox/Workspace $HOME
ln -s $HOME/Dropbox/Study $HOME
ln -s $HOME/Dropbox/Work $HOME

# Install fonts
mkdir -p $HOME/.fonts
cp $HOME/Dropbox/config/*.otf $HOME/Dropbox/config/*.ttf $HOME/.fonts/
fc-cache ~/.fonts

# Install jlisting.sty
sudo cp ~/Dropbox/config/jlisting.sty /usr/share/texlive/texmf-dist/tex/latex/listings/
sudo mktexlsr
