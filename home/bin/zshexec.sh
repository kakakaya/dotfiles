#!/usr/bin/zsh
# -*- coding:utf-8 -*-
PROCCOUNT=`expr \`ps -Afl | wc -l\` - 5`
if [[ -x /usr/bin/figlet ]]; then
    if [[ -e /usr/share/figlet/colossal.flf ]]; then
	figlet -f colossal $host 2>/dev/null
    else 
	figlet $host 2>/dev/null
    fi
fi
w

