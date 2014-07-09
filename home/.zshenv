# -*- Mode: shell-script;coding:utf-8 -*- #
# almost from https://github.com/shin3900/dotfiles/blob/master/.zshenv


userpath=( \			# 配列に候補を入れる
    $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin \
    $HOME/bin $HOME/.local/bin \
	)
addpath=()			# 確定した候補を入れていく受け皿
for i in "${userpath[@]}"; do	# 受け皿に追加していく
    chksame=0
    if [[ -d $i ]]; then		# システムにディレクトリが存在しなければ飛ばす
	for j in "${path[@]}"; do
	    if [[ $i = $j ]]; then # 重複しているなら重複フラグを立てておく
		chksame=1
		break
	    fi
	done
	if [[ $chksame = 0 ]] ; then # 重複フラグが立ってなければ受け皿に追加
	    addpath=( $addpath $i )
	fi
    fi
done
path=( $path $addpath )
unset userpath addpath i chksame # 後始末

if [[ -x /usr/bin/uname ]] || [[ -x /bin/uname ]]; then
    case "`uname -sr`" in
        FreeBSD*); export ARCHI="freebsd" ;;
        Linux*);   export ARCHI="linux"   ;;
        CYGWIN*);  export ARCHI="cygwin"  ;;
        *);        export ARCHI="dummy"   ;;
    esac
else
    export ARCHI="dummy"
fi
if [[ -x /bin/hostname ]]; then
    export HOST=`hostname`
fi;
export host=`echo $HOST | sed -e 's/\..*//'`

export UID
export SHELL=`which zsh`
export JLESSCHARSET="japanese"
export INFOPATH="$HOME/info:/usr/share/info:/usr/local/info"
export FTP_PASSIVE_MODE="NO"
export LANG="ja_JP.UTF-8" # or ja_JP.UTF8
export LC_ALL="ja_JP.UTF-8"

if which colorgcc >& /dev/null ; then
    export CC=`which colorgcc`
else
    export CC=`which gcc`
fi

if which lv >& /dev/null ; then
    export PAGER="lv"
else
    export PAGER="less -RM --quiet -x2"
fi

if which mupdf >& /dev/null ; then
    export PDFVIEWER="mupdf"
else
    export PDFVIEWER="evince"
fi
if which viewnior >& /dev/null; then
    export IMGVIEWER="viewnior"
else
    export IMGVIEWER="eog"
fi

export COLORTERM=0
case "$TERM" in
    xterm*);	COLORTERM=1 ;;  # putty
    mlterm*);	COLORTERM=1 ; TERM='kterm-color';;
    screen*);	COLORTERM=1 ;;
    ct100*);	COLORTERM=1 ;;	# TeraTermPro
    kterm*);	COLORTERM=1 ; TERM='kterm-color';;
    rxvt*);     COLORTERM=1
	export LANG=ja_JP.eucJP;   #w3m とか mutt とかに必要
	# export LC_ALL=ja_JP.eucJP;;
    #vim は TERM='kterm' ではカラー化しない
    #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
esac
if which jed >& /dev/null; then
    export EDITOR='jed'
else
    export EDITOR='nano'
fi
if [[ $COLORTERM -eq 1 ]]; then export LANG=ja_JP.UTF8; else export LANG=C; fi

if [[ `tty | cut -d / -f 3` = pts ]]
then
    case ${HOST} in
	Azurite)
	    #ThinkpadX200 setting
	    xset m 4 2
	    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
	    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
	    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
	    xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
	    ;;
	akari)
	    synclient TapButton1=1
	    synclient TapButton2=2
	    synclient TapButton3=3
	    synclient CircularScrolling=1
	    synclient CircScrollTrigger=0
	    ;;
    esac
fi
case ${HOST} in
    nest|rise|debian)
	#alias
	alias ayase='mplayer -quiet ~/bin/Chime/voice/ImAyase.wav'
	case ${HOST} in
	    nest*)
		alias kagitail='tail -1 /var/log/kagisys.log'
		;;
	esac
	#export
	export http_proxy='http://proxy.uec.ac.jp:8080'
	export ftp_proxy='http://proxy.uec.ac.jp:8080'
	export https_proxy='http://proxy.uec.ac.jp:8080'

	;;
    # purple*)
    # 	#JED
    # 	export PATH=$PATH:/home/staff/jed/avrdev/bin/:$HOME/local/bin
    # 	export LD_LIBRARY_PATH=/home/staff/jed/avrdev/supports/lib
    # 	setxkbmap dvorak
    # 	LANG=ja_JP.utf-8
    # 	export GTK_IM_MODULE=ibus
    # 	export XMODIFIERS=@im=ibus
    # 	export QT_IM_MODULE=ibus
    # 	export PYTHONPATH=~/lib/python/
    # 	ibus-daemon &
esac

