export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
xcompmgr &
pcmanfm -d &
urxvtd -q -f -o &
nm-applet --sm-disable &

# Keyboard
setkbmap dvorak
xmodmap .Xmodmap
~/bin/SandS.sh

if [ $(nmcli -t -f active,ssid dev wifi | grep "UECWireless" | wc -l) -gt 0 ]; then
    export http_proxy=http://proxy.uec.ac.jp:8080
    export https_proxy=http://proxy.uec.ac.jp:8080
    export ftp_proxy=http://proxy.uec.ac.jp:8080
    export HTTP_PROXY=http://proxy.uec.ac.jp:8080
    export HTTPS_PROXY=http://proxy.uec.ac.jp:8080
    export FTP_PROXY=http://proxy.uec.ac.jp:8080
fi

# Run some Terminal
if [[ -x /usr/bin/terminator ]]; then terminator &
elif [[ -x /usr/bin/urxvt ]]; then urxvt &
fi

if [[ -x /usr/bin/vmware-user ]]; then
    # VMware環境の場合
    /usr/bin/vmware-user
elif [[ -x /usr/bin/VBoxClient ]]; then
    # VirtualBox環境の場合(pass)
    :
else
    # 仮想環境ならホストOSにスクリーンセーバを任せる、さもなくば自分で起動する
    xscreensaver -no-splash &
    # メモリが4GB以上あり、かつ太陽が西から昇る場合はFirefoxを起動しておく
    if [ $(head -1 /proc/meminfo| awk '{print int($2/1024/1000)}') -ge 4 ] && false; then
        if  hash firefox >& /dev/null; then
            firefox
        fi
    fi
fi

# 前回異常終了していた場合、ロックファイルを削除してEmacsを起動
if [ -f $HOME/.emacs.desktop.lock ]; then
    if [ ! $(ps -p $(cat $HOME/.emacs.desktop.lock) -o comm=) = "emacs" ]; then
        rm $HOME/.emacs.desktop.lock
    fi
fi
emacs &

if [[ -x "$HOME/Enpass/runenpass.sh" ]]; then
    $HOME/Enpass/runenpass.sh &
fi

if [[ -x /usr/bin/dropbox ]]; then
    dropbox start
fi

# Setup X
feh --recursive --randomize --bg-fill $HOME/Pictures/Wallpapers/*
exec awesome
