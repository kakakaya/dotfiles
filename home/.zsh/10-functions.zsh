# -*- Mode: shell-script;coding:utf-8 -*- #
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
        exit
    fi

    if [ $? = 0 ]; then
        tw -yes "@kakakaya Successfully completed! at `strdatetime`"
    else
        tw -yes "@kakakaya Failed with Error code ${?} at `strdatetime`"
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
    tree -f $1 | grep -E "diary-.*md$" | xargs -n 1 | grep diary | xargs -I % sh -c "echo -n %; tail -2 %" | grep "*" | cut -d " " -f 1,3
}

function howm-count {
    awk '{s+=$1} END {print s}' <(tree -f $1 | grep -E "diary-.*md$" | xargs -n 1 | grep diary | xargs -n 1 tail -2 | grep -e "+" -e " -" | xargs -n 1 echo | grep -e "+" -e "-")
}
