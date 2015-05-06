#!/bin/sh
if hash peco 2>/dev/null; then
    COMMAND=$1
    PID=$(ps ax | grep $COMMAND | grep -v "pecokill" | grep -v "grep" | sort -r | peco | awk '{print $1}')
    if !([ -z $PID ]); then
        kill -9 $PID
    fi
else
    echo "peco command not found, install at https://github.com/peco/peco/releases"
fi
