# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500000
SAVEHIST=500000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kakakaya/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*:processes' menu yes select=2

autoload -Uz compinit
compinit
# End of lines added by compinstall

#setopt?
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
#zsh内蔵エディタを使う
autoload -U zcalc
autoload zed
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31' #kill の候補にも色付き表示
#入力途中の履歴補完
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end

setopt notify            # バックグラウンドジョブの状態変化を即時報告
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] " #ヒストリの一覧を読みやすい形に変更
LISTMAX=1000 #補完リストが多いときに尋ねない
#Alias
alias ch=cd
alias md=mkdir
alias ls='ls -h --show-control-char --color=always'
alias lh=ls
alias la='ls -aF'
alias ll='ls -ltr'
alias lla='ll -a'
alias lli='ll -i'
alias l.='ls -d .[a-zA-Z]* --color=always'
alias ll.='l. -lt'
alias less='less -MN'
alias em='emacs -nw'
alias strdate='date +%Y-%m-%d_%H-%M-%S'
alias Screenshot='import ~/Pictures/`strdate`.png'
alias getWindowID="xwininfo |grep '^xwininfo: Window id:' | awk '{print $4}'"
alias gpp='g++'
alias sudo='sudo ' #makes alias-sudo able
#alias unzip='gunzip -S zip'
#alias untargz='tar -zxvf'
alias rmd='rm -r'
alias rmi='rm -i'
#Keyboard
alias aoeu='setxkbmap us'
alias ueoa='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias fdsa='setxkbmap dvorak'
alias lxmodmap='xmodmap ~/.Xmodmap'
alias cdiff='colordiff -c'
alias ttyclock='tty-clock -stc'
alias boundclock='tty-clock -str'
alias uecchrome='chromium --proxy-server=proxy-east.uec.ac.jp:8080 1>/dev/null &'
alias zshupdate='cp $HOME/.zshrc $HOME/.zshrc_log/.`strdate`.zshrc;scp moon:.zshrc $HOME/.'
alias cati='catimg.sh'
alias killmebaby='pkill -9 sshd'
alias mkgitignore='git status -s | grep -e "^\?\?" | cut -c 4- >> .gitignore'
alias postbox='tw -pipe'
alias streaming='tw -st'
#pipe
alias -g L='| lv'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g LE='|& less'
alias -g HE='|& head'
alias -g TE='|& tail'
alias -g GE='|& grep'
alias -g WE='|& wc'
alias -g SE='|& sed'
alias -g AE='|& awk'

alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
function runcpp () { g++ -O2 $1; ./a.out }
if [ `uname` = "Darwin" ]; then
  alias google-chrome='open -a Google\ Chrome'
fi
alias chrome='google-chrome'
alias -s html=chrome
alias -s {c,cpp}=runcpp
if [ `uname` = "Darwin" ]; then
  alias eog='open -a Preview'
fi
alias -s {png,jpg,bmp,PNG,JPG,BMP}=eog
alias -s mp3=mplayer
alias -s py=python


#EXPORT/EVAL
export EDITOR='emacs -nw'
export LANG=ja_JP.UTF8
export PATH=$PATH:$HOME/bin:$HOME/.local/bin
eval "$(hub alias -s)"
#PROMPT
[ $(echo "$ZSH_VERSION" | cut -c1) -ge 5 ] && zle_highlight=(default:fg=yellow, isearch:bold,fg=red)
PROMPT="
[%n@%m]:%F{green}%~%f
%#"
RPROMPT="%(?.%F{green}٩('ω')و%f.%F{red}（˘⊖˘）oO[%?]%f)%*"
PROMPT2="%_%%>"
SPROMPT="%R? maybe %r.[nyae]"

#aclsh
case ${HOST} in
    sun)
	alias ls='ls'
	RPROMPT="%(?.%F{green}OK%f.%F{red}Error!%B[%?]%b%f) %*"
	;;
    nest*|fg8*|rise*)
	#alias
	alias ayase='mplayer -quiet ~/bin/Chime/voice/ImAyase.wav'
	case ${HOST} in
	    nest*)
		alias kagitail='tail -1 /var/log/kagisys.log'
		;;
	esac
	#prompt
	RPROMPT="%(?.%F{green}OK%f.%F{red}Error!%B[%?]%b%f) %*"
	#export
	export http_proxy='http://proxy.uec.ac.jp:8080'
	export ftp_proxy='http://proxy.uec.ac.jp:8080'
	export https_proxy='http://proxy.uec.ac.jp:8080'

	;;
    Azurite)
#ThinkpadX200 setting
	#alias
	alias yumUpdate='sudo yum update;clear'
	#export
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
#alias suffix
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

#EXEC(LAST)
w
echo
case ${HOST} in
    nest*)
	#catimg.sh printIt/Done/maked_MMA.jpg
	echo ''
	;;
esac
