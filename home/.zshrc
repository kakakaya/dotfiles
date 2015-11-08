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

# ================ setopt/autoload/zstyle ================ #
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
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31' #kill の候補にも色付き表示
#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward #-end
bindkey "^N" history-beginning-search-forward #-end
setopt notify            # バックグラウンドジョブの状態変化を即時報告
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] " #ヒストリの一覧を読みやすい形に変更
export LISTMAX=1000 #補完リストが多いときに尋ねない

if [[ -e /usr/share/autojump/autojump.sh ]];then . /usr/share/autojump/autojump.sh ;fi

#================ npm ================
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
    _npm_completion () {
        local si="$IFS"
        IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
            COMP_LINE="$COMP_LINE" \
            COMP_POINT="$COMP_POINT" \
            npm completion -- "${COMP_WORDS[@]}" \
            2>/dev/null)) || return $?
        IFS="$si"
    }
    complete -F _npm_completion npm
elif type compdef &>/dev/null; then
    _npm_completion() {
        si=$IFS
        compadd -- $(COMP_CWORD=$((CURRENT-1)) \
            COMP_LINE=$BUFFER \
            COMP_POINT=0 \
            npm completion -- "${words[@]}" \
            2>/dev/null)
        IFS=$si
    }
    compdef _npm_completion npm
elif type compctl &>/dev/null; then
    _npm_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                                     COMP_LINE="$line" \
                                     COMP_POINT="$point" \
                                     npm completion -- "${words[@]}" \
                                     2>/dev/null)) || return $?
        IFS="$si"
    }
fi
compctl -K _npm_completion npm
#================ npm end ================

#================ function ================
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
    *.7z) 7z x $1;;
  esac
}

function runcpp () { g++ -O2 $1; ./a.out }
function runjavac() {javac $1}
function runjavaclass() {java $1}
function runjar() {java -jar $1}
function rungo() {go run $1}

function notify-tw() {
    if [ ! hash tw 2>/dev/null ]; then
        echo "tw not found"
    elif [ $? = 0 ]; then
        tw -yes "@kakakaya Successfully completed! at `date`"
    else
        tw -yes "@kakakaya Failed with Error code ${?} at `date`"
    fi
}
# function exist () {
#     if type $1 >/dev/null 2>&1;
#     then
#         return 0
#     else
#         return 1
#     fi
# }
# function git-current-branch {
#     local name st color gitdir action
#     if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then return;fi
#     name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
#     if [[ -z $name ]]; then return;fi

#     gitdir=`git rev-parse --git-dir 2> /dev/null`
#     action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

#     st=`git status 2> /dev/null`
#     if [[ "$st" =~ "(?m)^nothing to" ]]; then
#         color=%F{green}
#     elif [[ "$st" =~ "(?m)^nothing added" ]]; then
#         color=%F{yellow}
#     elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
#         color=%B%F{red}
#     else
#         color=%F{red}
#     fi
#     echo "($color$name$action%f%b) "
# }
function current-battery {
    if [ -d /sys/class/power_supply/BAT0 ] ; then
        local per
        if [ ! -x /usr/bin/acpi ]; then return; fi
        per=$(acpi -b | cut -d ' ' -f 4 | cut -d ',' -f 1)
        if [ $(acpi -a | grep on | wc -l) -eq 0 ]; then
            echo "%F{red}$per%%f"
        else
            echo "%F{green}$per%%f"
        fi
    fi
}

function zsh-autocmp {
    # Setup zsh-autosuggestions
    source ~/.zsh-autosuggestions/autosuggestions.zsh
    # Enable autosuggestions automatically
    zle-line-init() {
        zle autosuggest-start
    }
    zle -N zle-line-init
}
function simple-term {
    RPROMPT="%(?.%F{green}('_'%)%f.%F{red}(;_;%)[%?]%f)%*"
}

function howm-cd {
    cd `date "+$HOME/howm/%Y/%m"`
}

function howm-check {
    tree -f $1 | xargs -n 1  | grep -E "diary-.*md$" | xargs -I % sh -c "echo -n %; tail -2 %" | grep "*" | awk '{print $1, $3}'
}

function howm-count {
    awk '{s+=$1} END {print s}' <(tree -f $1 | xargs -n 1 | grep -E "diary-.*md$" | grep "diary" | xargs -n 1 tail -2 | grep -e "+" -e " -" | awk '{print $2}')
}
#================ function end ================
# Alias config
if [ -f ~/.alias ]; then
    source ~/.alias
else
    echo "~/.alias not found."
fi
#================ PROMPT ================ #
PROMPT='
[%n@%m$(current-battery)]<${LINENO}/%!>:%F{cyan}%~%f
%#'
if [ $COLORTERM -eq 1 ]; then
    RPROMPT="%(?.%F{green}٩('ω')و%f.%F{red}（˘⊖˘）oO[%?]%f)%*";
else
    RPROMPT="%(?.%F{green}('_'%)%f.%F{red}(;_;%)[%?]%f)%*";
fi
PROMPT2="%_%%>"

#SPROMPT="%R? maybe %r.[nyae]"
[ $(echo "$ZSH_VERSION" | cut -c1) -ge 5 ] && zle_highlight=(default:bold,fg=yellow, isearch:fg=red)

#EXEC
[ -f $HOME/bin/zshexec.sh ] && $HOME/bin/zshexec.sh
[ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ] && zcompile ~/.zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -d ~/.zsh-autosuggestions ] && zsh-autocmp

# start zsh with status 0
true
