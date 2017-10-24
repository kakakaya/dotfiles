# -*- Mode: shell-script;coding:utf-8 -*- #

userpath=(
    # 配列に候補を入れる
    $HOME/bin \
        $HOME/usr/bin \
        $HOME/local/bin \
        $HOME/.local/bin \
        $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin
)
addpath=()                      # 確定した候補を入れていく受け皿
for i in "${userpath[@]}"; do	# 受け皿に追加していく
    chksame=0
    if [[ -d $i ]]; then # システムにディレクトリが存在しなければ飛ばす
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

# zsh-completionがインストールされていたら読み込む
if [[ -d $HOME/src/github.com/zsh-users/zsh-completions ]]; then
    export FPATH="$HOME/src/github.com/zsh-users/zsh-completions/src:$FPATH"
fi

# .zsh/completionsディレクトリがあれば読み込む
if [[ -d $HOME/.zsh/completions ]]; then
    export FPATH="$HOME/.zsh/completions:$FPATH"
fi

# ディレクトリの存在に応じたパスなどの設定
if [[ -d $HOME/Dropbox/bin ]]; then
    export PATH=$PATH:"$HOME/Dropbox/bin"
fi

if [[ -d /opt/gurobi ]]; then
    # 離散最適化ツールgurobiがインストールされていたらPATHを通す
    export GUROBI_HOME="/opt/gurobi/linux64"
    export PATH="${PATH}:${GUROBI_HOME}/bin"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
fi

if [[ -d $HOME/.local/google_appengine ]]; then
    # Google App Engine SDK がインストールされていたらPATHを通す
    export PATH="$PATH:$HOME/.local/google_appengine"
fi

if [[ -x /usr/bin/uname || -x /bin/uname ]]; then
    case "$(uname -sr)" in
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

# export UID
export SHELL=`which zsh`
export JLESSCHARSET="japanese"
export INFOPATH="$HOME/info:/usr/share/info:/usr/local/info"
export FTP_PASSIVE_MODE="NO"
export LANG="ja_JP.UTF-8" # or ja_JP.UTF8
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
export REPORTTIME=3             # 3秒以上かかったら時間表示をする

# エディタ関連の環境変数
export PAGER='less'
if hash jed >& /dev/null; then
    export EDITOR='jed'
else
    export EDITOR='nano'
fi
export VISUAL='emacsclient -c -nw -a $EDITOR' # Open Emacs Window by my hand!
export SUDO_EDITOR='$VISUAL'

export LESS='-giMR -j10' # show last, ignore case, show % and lineno at prompt, raw-control-char, no return at end of screen, 10 blanks
[[ -x /usr/share/source-highlight/src-hilite-lesspipe.sh ]] && export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'

export FZF_DEFAULT_OPTS="--reverse --cycle --extended"

# Python works well with nohup
export PYTHONIOENCODING='UTF-8'
# Golang is not GOD
# export GOROOT="/usr/lib/go"
if [[ -x /usr/local/go ]]; then
    export PATH=/usr/local/go/bin:$PATH
fi

# pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# nodenv
[[ -d $HOME/.nodenv ]] && export PATH="$HOME/.nodenv/bin:$PATH" && eval "$(nodenv init -)"

export GOPATH="$HOME"

# export LC_ALL="ja_JP.UTF-8"

if hash colorgcc >& /dev/null ; then
    export CC=`which colorgcc`
else
    export CC=`which gcc`
fi

if hash mupdf >& /dev/null ; then
    export PDFVIEWER="mupdf"
else
    export PDFVIEWER="evince"
fi
if hash viewnior >& /dev/null; then
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
          # export LANG=ja_JP.eucJP;   #w3m とか mutt とかに必要
          # export LC_ALL=ja_JP.eucJP;;
          #vim は TERM='kterm' ではカラー化しない
          #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
          ;;
esac
if [[ $COLORTERM -eq 1 ]]; then
    export LC_ALL=ja_JP.UTF8
    # TERM='rxvt-unicode-256color' # 多くの環境で文句言われる、
    TERM='xterm-256color'       # これでも問題無さそう
fi

if [[ `tty | cut -d / -f 3` = pts ]]; then
    # This is in X
    local PRODUCT="UNKNOWN"
    if [[ -f '/sys/devices/virtual/dmi/id/product_name' ]]; then
        PRODUCT="$(cat /sys/devices/virtual/dmi/id/product_name)"
    fi
    case "$PRODUCT" in
        74574PJ*)               # Azurite, megumin, etc
        # ThinkpadX200
        #
        # xset m 4 2
        # xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
        # xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
        # xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
        # xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
        ;;
        akari)                  # old PC from mountain, in MMA
            synclient TapButton1=1
            synclient TapButton2=2
            synclient TapButton3=3
            synclient CircularScrolling=1
            synclient CircScrollTrigger=0
            ;;
    esac
else
    # This is in console
    LANG=C
fi

case ${HOST} in
    nest*|rise*|debian*)
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
    #   #JED
    #   export PATH=$PATH:/home/staff/jed/avrdev/bin/:$HOME/local/bin
    #   export LD_LIBRARY_PATH=/home/staff/jed/avrdev/supports/lib
    #   setxkbmap dvorak
    #   LANG=ja_JP.utf-8
    #   export GTK_IM_MODULE=ibus
    #   export XMODIFIERS=@im=ibus
    #   export QT_IM_MODULE=ibus
    #   export PYTHONPATH=~/lib/python/
    #   ibus-daemon &
esac

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
