# /etc/zsh/zlogout: system-wide .zlogout file for zsh(1).
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
