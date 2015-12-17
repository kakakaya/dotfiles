#!/bin/sh
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Tue Oct 20 17:08:36 2015

if [[ ! -d $HOME/Dropbox/bin ]]; then
    echo "Run this script after Dropbox's sync end!"
    exit 1;
fi

# Make symbolic link
ln -s $HOME/Dropbox/howm $HOME/howm         # For later
ln -s $HOME/Dropbox/Workspace $HOME/Workspace
ln -s $HOME/Dropbox/Study $HOME/Study
ln -s $HOME/Dropbox/Work $HOME/Work
# ln -s $HOME/Dropbox/ $HOME/

# Install fonts
if [ -d $HOME/.fonts ] ; then
    cp $HOME/Dropbox/config/Inconsolata.otf $HOME/.fonts/
    cp $HOME/Dropbox/config/Ricty-Regular.ttf $HOME/.fonts/
    cp $HOME/Dropbox/config/Ricty-Bold.ttf $HOME/.fonts/
fi

# Install jlisting.sty
sudo cp ~/Dropbox/config/jlisting.sty /usr/share/texlive/texmf-dist/tex/latex/listings/
sudo mktexlsr
