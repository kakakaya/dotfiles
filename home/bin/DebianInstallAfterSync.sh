#!/bin/sh

if ![ -d $HOME/Dropbox/bin ]; then
    exit 1;
fi

# Make symbolic link
ln -s $HOME/Dropbox/howm $HOME/howm         # For later
ln -s $HOME/Dropbox/ $HOME/
ln -s $HOME/ $HOME/
ln -s $HOME/ $HOME/

# Install fonts
if [ -d $HOME/.fonts ] ; then
    cp $HOME/Dropbox/config/Inconsolata.otf $HOME/.fonts/
    cp $HOME/Dropbox/config/Ricty-Regular.ttf $HOME/.fonts/
    cp $HOME/Dropbox/config/Ricty-Bold.ttf $HOME/.fonts/
fi

# Install jlisting.sty
sudo cp ~/Dropbox/config/jlisting.sty /usr/share/texlive/texmf-dist/tex/latex/listings/
sudo mktexlsr

