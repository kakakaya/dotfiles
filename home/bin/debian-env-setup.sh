#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Thu Aug 18 16:55:02 2016

# golang
mkdir -p ~/.fonts ~/tmp ~/mnt ~/git ~/.ssh ~/.local/go

# install peco
GOPATH="$HOME/.local/go" go get github.com/peco/peco/cmd/peco

echo "change shell"
chsh -s /bin/zsh $USER

# Dropbox initialize
# dropbox start -i

exit 0
