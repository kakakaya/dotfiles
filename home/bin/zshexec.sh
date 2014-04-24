#!/usr/bin/zsh
# -*- coding:utf-8 -*-
PROCCOUNT=`expr \`ps -Afl | wc -l\` - 5`
if [[ -x /usr/bin/figlet ]]; then figlet -f colossal $host;fi
w

