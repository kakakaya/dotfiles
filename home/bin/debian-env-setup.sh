#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Thu Aug 18 16:55:02 2016

mkdir -p ~/.fonts ~/tmp ~/mnt ~/git ~/.ssh ~/.local/go

# install go packages
export GOPATH="$HOME"
go get "github.com/peco/peco/cmd/peco"
go get "github.com/nsf/gocode"
go get "github.com/k0kubun/pp"
go get "github.com/motemen/ghq"
go get "github.com/github/hub"

# sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o ~/bin/emojify && chmod +x ~/bin/emojify"

echo "change shell"
chsh -s /bin/zsh $USER

# Dropbox initialize
# dropbox start -i

exit 0
