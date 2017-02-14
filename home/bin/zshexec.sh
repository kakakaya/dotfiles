#!/usr/bin/env zsh
# -*- coding:utf-8 -*-
# This shows startup screen for zsh
# PROCCOUNT=`expr \`ps -Afl | wc -l\` - 5`
if [ "$SHLVL" -le 2 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    if hash fortune >& /dev/null; then
        if [ -e /usr/share/figlet/colossal.flf ]; then
            figlet -f colossal "$host" 2>/dev/null
        else
            figlet "$host" 2>/dev/null
        fi
    fi
    if hash fortune >& /dev/null; then
        # show some fortune
        fortune -a
    fi
    w
fi
