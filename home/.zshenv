# -*- Mode: shell-script;coding:utf-8 -*- #
# almost from https://github.com/shin3900/dotfiles/blob/master/.zshenv
if [ -x /usr/bin/uname ] || [ -x /bin/uname ]; then
    case "`uname -sr`" in
        FreeBSD*); export ARCHI="freebsd" ;;
        Linux*);   export ARCHI="linux"   ;;
        CYGWIN*);  export ARCHI="cygwin"  ;;
        *);        export ARCHI="dummy"   ;;
    esac
else
    export ARCHI="dummy"
fi
if [ -x /bin/hostname ]; then
    export HOST=`hostname`
fi;
export host=`echo $HOST | sed -e 's/\..*//'`

export UID
export SHELL=`which zsh`
export CC=`which gcc`
export JLESSCHARSET="japanese"
export INFOPATH="$HOME/info:/usr/share/info:/usr/local/info"
export FTP_PASSIVE_MODE="NO"
export LANG="ja_JP.UTF-8" # or ja_JP.UTF8

if which lv >& /dev/null ; then
  export PAGER="lv"
else
  export PAGER="less -RM --quiet -x2"
fi
export COLORTERM=0
case "$TERM" in 
    xterm*);	COLORTERM=1 ;;  # putty
    mlterm*);	COLORTERM=1 ; TERM='kterm-color';;
    screen*);	COLORTERM=1 ;;
    ct100*);	COLORTERM=1 ;;	# TeraTermPro
    kterm*);	COLORTERM=1 ; TERM='kterm-color'
      export LANG=ja_JP.eucJP;   #w3m とか mutt とかに必要
      export LC_ALL=ja_JP.eucJP;;
    #vim は TERM='kterm' ではカラー化しない
    #screen は TERM='kterm-color' ではタイトルバーに情報表示できない
esac
export EDITOR='emacs -nw'
export LANG=ja_JP.UTF8
[ $COLORTERM == 0 ] && export LANG=C
userpath=( \			# 配列に候補を入れる
    $path /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin \
    $HOME/bin \
	)
addpath=()			# 確定した候補を入れていく受け皿
for i in "${userpath[@]}"; do	# 受け皿に追加していく
    chksame=0
    if [ -d $i ]; then		# システムにディレクトリが存在しなければ飛ばす
	for j in "${path[@]}"; do
	    if [ $i = $j ]; then # 重複しているなら重複フラグを立てておく
		chksame=1
		break
	    fi
	done
	if [ $chksame = 0 ] ; then # 重複フラグが立ってなければ受け皿に追加
	    addpath=( $addpath $i )
	fi
    fi
done
path=( $path $addpath )
unset userpath addpath i chksame # 後始末




