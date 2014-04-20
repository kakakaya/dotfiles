# -*- Mode: shell-script;coding:utf-8 -*- #
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kakakaya/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z} r:|[-_.]=**' #'m:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*:processes' menu yes select=2

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ---------------- setopt/autoload/zstyle ---------------- #
setopt prompt_subst
setopt auto_pushd
setopt auto_menu
zstyle ':completion:*:default' menu select=1
setopt correct
setopt hist_ignore_dups
setopt share_history
setopt list_packed
setopt no_beep
setopt nolistbeep
setopt rm_star_wait
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt hist_expand
setopt hist_reduce_blanks
setopt re_match_pcre
#zsh内蔵エディタを使う
autoload -U zcalc
autoload -U zed
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31' #kill の候補にも色付き表示
#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward #-end
bindkey "^N" history-beginning-search-forward #-end
setopt notify            # バックグラウンドジョブの状態変化を即時報告
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] " #ヒストリの一覧を読みやすい形に変更
export LISTMAX=1000 #補完リストが多いときに尋ねない

if [[ -e /usr/share/autojump/autojump.zsh ]];then source /usr/share/autojump/autojump.zsh;fi

#---------------- function ----------------
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}

function runcpp () { g++ -O2 $1; ./a.out }

# function exist () {
#     if type $1 >/dev/null 2>&1;
#     then
# 	return 0
#     else
# 	return 1
#     fi
# }

function git-current-branch {
    local name st color gitdir action
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then return;fi
    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
    if [[ -z $name ]]; then return;fi
    
    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
    
    st=`git status 2> /dev/null`
    if [[ "$st" =~ "(?m)^nothing to" ]]; then
        color=%F{green}
    elif [[ "$st" =~ "(?m)^nothing added" ]]; then
        color=%F{yellow}
    elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
        color=%B%F{red}
    else
        color=%F{red}
    fi    
    echo "($color$name$action%f%b) "
}

#---------------- function end ----------------
# ---------------- alias ---------------- #
# -------- must-alias -------- #
alias md=mkdir
alias ls='ls -h --show-control-char --color=always'
alias lh=ls
alias la='ls -aF'
alias ll='ls -ltr'
alias lla='ll -a'
alias lli='ll -i'
alias l.='ls -d .[a-zA-Z]* --color=always'
alias ll.='l. -lt'
alias less='less -MN -gj10'
alias em='emacs -nw'
alias strdate='date +%Y-%m-%d_%H-%M-%S'
alias gpp='g++'
alias sudo='sudo ' #makes alias-sudo able
alias rmi='rm -i'
alias rmd='rm -r'
alias history='history -iD'
alias g='git'
# -------- must-alias end -------- #
# -------- may-alias -------- #
alias Screenshot='import ~/Pictures/`strdate`.png' #reccomend:shutter
alias getWindowID="xwininfo |grep '^xwininfo: Window id:' | awk '{print $4}'"
#Keyboard
alias aoeu='setxkbmap us'
alias ueoa='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias fdsa='setxkbmap dvorak'
alias lxmodmap='xmodmap ~/.Xmodmap'
alias cdiff='colordiff -c'
alias mkgitignore='git status -s | grep -e "^\?\?" | cut -c 4- >> .gitignore'
alias postbox='tw -pipe'
alias streaming='tw -st'
alias sl='sl -e'
alias tiglog='git log --graph --pretty=oneline --abbrev-commit | tig'
alias psauxG='ps aux | grep'

alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
alias -s {png,jpg,bmp,PNG,JPG,BMP}=$IMGVIEWER
alias -s mp3=mplayer
alias -s py=python
if [[ `uname` = "Darwin" ]]; then
    alias google-chrome='open -a Google\ Chrome'
else
    alias google-chrome='chromium'
fi
alias chrome='google-chrome'
alias -s html=chrome
alias -s {c,cpp}=runcpp
if [[ `uname` = "Darwin" ]]; then
    alias IMGVIEWER='open -a Preview'
fi
if hash trash-put 2>/dev/null; then alias rm='trash-put';fi
if hash hub 2>/dev/null; then eval "$(hub alias -s)" ; fi
#pipe
alias -g L='| lv'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g LE='|& less'
alias -g LER='|& less -R'
alias -g DCLER='| colordiff -c |& less -R'
alias -g HE='|& head'
alias -g TE='|& tail'
alias -g GE='|& grep'
alias -g WE='|& wc'
alias -g SE='|& sed'
alias -g AE='|& awk'
# -------- may-alias end -------- #
# -------- maybe-alias -------- #
alias uecchrome='chromium --proxy-server=proxy.uec.ac.jp:8080 1>/dev/null 2>/dev/null &'
alias ttyclock='tty-clock -stc' # Nomal
alias boundclock='tty-clock -str' # It moves!
alias killmebaby='pkill -9 sshd'
# -------- maybe-alias end -------- #
#---------------- alias end ----------------#


#---------------- PROMPT ---------------- #
PROMPT='
[%n@%m]<${LINENO}/%!>`git-current-branch`:%F{cyan}%~%f
%#'
if [ $COLORTERM -eq 1 -a $HOST != iPod-kakakaya -a $HOST != kakakaya_FPK ];
then RPROMPT="%(?.%F{green}٩('ω')و%f.%F{red}（˘⊖˘）oO[%?]%f)%*";
else RPROMPT="%(?.%F{green}('_'%)%f.%F{red}(;_;%)[%?]%f)%*";
fi
PROMPT2="%_%%>"
#SPROMPT="%R? maybe %r.[nyae]"
[ $(echo "$ZSH_VERSION" | cut -c1) -ge 5 ] && zle_highlight=(default:bold,fg=yellow, isearch:fg=red)

#---------------- PROMPT end ----------------#
#aclsh
case ${HOST} in
    nest*|fg8*|rise*)
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
    purple*)
	#JED
	export PATH=$PATH:/home/staff/jed/avrdev/bin/:$HOME/local/bin
	export LD_LIBRARY_PATH=/home/staff/jed/avrdev/supports/lib
	setxkbmap dvorak
	LANG=ja_JP.utf-8
	export GTK_IM_MODULE=ibus
	export XMODIFIERS=@im=ibus
	export QT_IM_MODULE=ibus
	export PYTHONPATH=~/lib/python/
	ibus-daemon &

esac

#EXEC
if [ -f $HOME/bin/zshexec.sh ]; then $HOME/bin/zshexec.sh; fi
