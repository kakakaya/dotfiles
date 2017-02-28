#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Thu Aug 18 16:55:02 2016

mkdir -p ~/.fonts ~/tmp ~/mnt ~/git ~/.ssh ~/.local/go

# go packages
export GOPATH="$HOME"
go get -u -v "github.com/peco/peco/cmd/peco" \
   "github.com/nsf/gocode" \
   "github.com/k0kubun/pp" \
   "github.com/motemen/ghq" \
   "github.com/github/hub" \
   "github.com/nsf/gocode" \
   "github.com/rogpeppe/godef" \
   "golang.org/x/tools/cmd/guru" \
   "golang.org/x/tools/cmd/gorename" \
   "golang.org/x/tools/cmd/goimports"

# install powerline
ghq get -v "powerline/powerline"

# install pythonz
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "change shell"
chsh -s /bin/zsh $USER

# Dropbox initialize
# dropbox start -i

exit 0
