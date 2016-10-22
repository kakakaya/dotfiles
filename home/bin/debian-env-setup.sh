#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Thu Aug 18 16:55:02 2016

mkdir -p ~/.fonts ~/tmp ~/mnt ~/git ~/.ssh ~/.local/go

# go packages
export GOPATH="$HOME"
go get -v "github.com/peco/peco/cmd/peco"
go get -v "github.com/nsf/gocode"
go get -v "github.com/k0kubun/pp"
go get -v "github.com/motemen/ghq"
go get -v "github.com/github/hub"

# install powerline
ghq get -v "powerline/powerline"

# install pythonz
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "change shell"
chsh -s /bin/zsh $USER

# Dropbox initialize
# dropbox start -i

exit 0
