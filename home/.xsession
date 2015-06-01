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
    # chromeを起動しておく
    if [[ -x /usr/bin/google-chrome ]]; then
        google-chrome &
    elif [[ -x /usr/bin/chromium ]]; then
        chromium &
    fi
fi
emacs &

if [[ -x /usr/bin/dropbox ]]; then
    dropbox start
fi

# Setup X
feh --recursive --randomize --bg-fill $HOME/Pictures/Wallpapers/*
exec awesome
