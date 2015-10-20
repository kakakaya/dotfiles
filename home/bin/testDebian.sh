#!/bin/sh
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Tue Oct 20 17:04:32 2015

# Add testing repository
cat <<EOF | sudo tee -a /etc/apt/sources.list >/dev/null

# ================Installed by testDebian.sh================
deb http://ftp.jp.debian.org/debian/ testing main contrib non-free
deb-src http://ftp.jp.debian.org/debian/ testing main contrib non-free

deb http://ftp.jp.debian.org/debian/ testing-updates main contrib non-free
deb-src http://ftp.jp.debian.org/debian/ testing-updates main contrib non-free

deb http://security.debian.org/ testing/updates main contrib non-free
deb-src http://security.debian.org/ testing/updates main contrib non-free
EOF
