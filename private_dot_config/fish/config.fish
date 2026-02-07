if not set --query fish_private_mode
    history merge
end

# ================
# Set PATHes
# ================

if test -d $HOME/.local/bin
    set -x PATH $PATH $HOME/.local/bin
end

# Pyenv
if test -d $HOME/.pyenv
    set -x PATH $PATH $HOME/.pyenv/bin
    pyenv init - | source
end

# Golang
set -x GOPATH $HOME
set -x PATH $PATH $HOME/bin

# Rust
if test -d $HOME/.cargo/bin
    set -x PATH $PATH $HOME/.cargo/bin
end

# iTerm2
if test -f $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
    export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
end

# opam
if test -f $HOME/.opam/opam-init/init.fish
    source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

if test -f /opt/google-cloud-cli/path.fish.inc
    source /opt/google-cloud-cli/path.fish.inc
end

# rename tmux window
function window_rename --on-event fish_preexec
    if type -q tmux ;and set -q TMUX ;and test -n $argv[1]
        tmux rename-window (printf "%.8s" $argv[1])
    end
end

# pager
set -gx PAGER less
if type -q bat
    set -gx PAGER bat
    set -gx MANPAGER "bat -l man -p"
end
set -gx LESS --HILITE-UNREAD --ignore-case --jump-target=5 --LONG-PROMPT --no-init --RAW-CONTROL-CHARS

set -gx EDITOR nano
if type -q helix
    set -gx EDITOR helix
end

# direnv
if type -q direnv
    eval (direnv hook fish)
end

# rbenv
if type -q rbenv
    status --is-interactive; and source (rbenv init -|psub)
end

# asdf
if type -q asdf
    status --is-interactive; and source /usr/local/opt/asdf/asdf.fish
end

# mise
if type -q mise
    mise activate fish | source
end

# gem bin
if type -q gem
    set -gx PATH (gem environment | grep -E "EXECUTABLE DIRECTORY" | cut -d ':' -f 2 | cut -d ' ' -f 2) $PATH
    set -gx GEM_ROOT (ruby -e 'print Gem.user_dir')
end

# fuck
if type -q thefuck
    thefuck --alias | source
end

# starship
if type -q starship
    starship init fish | source
end

if type -q task
    task --completion fish | source
end

# zellij
if type -q zellij
    # status --is-interactive; and eval (zellij setup --generate-auto-start fish | string collect)
end

# zoxide
if type -q zoxide
    zoxide init fish | source
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
