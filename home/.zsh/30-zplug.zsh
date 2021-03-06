# -*- Mode: shell-script;coding:utf-8 -*- #

# Vanilla shell
zplug "yous/vanilli.sh"

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"

# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting"

# ZSH port of Fish shell's history search feature
zplug "zsh-users/zsh-history-substring-search"

# fzf
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# export ENHANCD_COMMAND="c"

# emoji-cli provides input completion for emoji on the command line with an interactive filter.
zplug "b4b4r07/emoji-cli"
export EMOJI_CLI_KEYBIND="^[e"
zplug "mrowa44/emojify", as:command, use:emojify rename-to:emojify


zplug "mollifier/cd-gitroot"

# compinit 以降に読み込むようにロードの優先度を変更する（10~19にすれば良い）
# 色が醜い
# zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "zsh-users/zsh-completions", depth:1

zplug "rupa/z", use:z.sh

zplug load
