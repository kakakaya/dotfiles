~/bin/SandS.sh
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
xcompmgr &
pcmanfm -d &
urxvtd -q -f -o &
nm-applet --sm-disable &

setkbmap dvorak
xmodmap .Xmodmap
xscreensaver -no-splash &

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

if [[ -x /usr/bin/google-chrome ]]; then
    google-chrome &
fi
if [[ -x /usr/bin/vmware-user ]]; then
    /usr/bin/vmware-user
fi
emacs &

if [[ -x /usr/bin/dropbox ]]; then
    dropbox start
fi

exec awesome
