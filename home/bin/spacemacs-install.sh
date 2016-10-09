#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Wed Apr 27 11:36:04 2016

emacs_dir=$(file "$HOME/.emacs.d" | cut -d ' ' -f 2)
if [ "$emacs_dir" == 'cannot' ]; then
    # $HOME/.emacs.d: cannot open `$HOME/.emacs.d' (No such file or directory)
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    return 0
else
    while true; do
        read -p "$HOME/.emacs.d is $emacs_dir. Move and install Spacemacs?[yN]" yn
        case $yn in
            [Yy]* )
                echo "install."
                mv "$HOME/.emacs.d" "$HOME/.emacs.d.$(date +%Y-%m-%d_%H-%M-%S).bak"
                git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
                return 0
                ;;

            * )
                echo "exit."
                return 1
                ;;
        esac
    done
fi
