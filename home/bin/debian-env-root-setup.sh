#!/bin/bash
# -*- mode:shell-script; coding:utf-8 -*-
# Author: kakakaya, Date: Thu Aug 18 18:48:27 2016

# Install with other package management systems.

# pip
easy_install3 pip
pip install -U pip
pip install -U virtualenv

# npm
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs
npm install -g marked tern html

exit 0
