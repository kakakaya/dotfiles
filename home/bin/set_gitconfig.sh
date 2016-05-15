#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Mon May 16 00:57:21 2016

if ! hash git >& /dev/null; then
    # gitが未インストール
    exit 0
fi

# set username
echo "Setting $(getent passwd $(whoami) | cut -d ":" -f 5 | cut -d "," -f 1) for user.name."
git config --global user.name $(getent passwd $(whoami) | cut -d ":" -f 5 | cut -d "," -f 1)

# set email
read -p "Enter email adress for user.email.[kakakaya+git@gmail.com] " gitmail
gitmail=${gitmail:-"kakakaya+git@gmail.com"}
echo "Setting $gitmail for user.email."
git config --global user.email $gitmail
