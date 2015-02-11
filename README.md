# What's this
@kakakayaのdotfilesいわゆる設定集。
再配布禁止なものが混じってそうな問題は修正済み。……たぶん。

# Contents
## Emacs
そのうちcask使う設定に変える、そのうち
* home/.emacs.d/init.el
起動時の画像表示用画像集
* home/.emacs.d/splash-images

## zsh
癖は弱めのはず
* home/.zshrc
* home/.zshenv
* home/.zlogout

## alias
.zshrcが長いので分離した
* home/.alias

## awesome
適当に動く程度
* .config/awesome/rc.lua
* .config/awesome/themes/my-zenburn/theme.lua

## terminator
適当に動く
* .config/terminator/config


## flake8
Elpy用
* .config/flake8

## .screenlayout
叩くと調整される。自分用。
* home/.screenlayout/Azurite_only.sh
* home/.screenlayout/Azurite_with_DELL.sh

## xsession
学内LAN向け設定など
* home/.xsession

## zshexec.sh
起動後の表示をする、というかMOTD自分用というスタンス?
home/bin/zshexec.sh

## Xmodmap
普通のCaps化+自分の環境でtildaが消えた時の対策版。
* home/.Xmodmap

## /etc
見ればわかる？motd
* etc/motd
Debianで上手く動きそうなdvorak的キーボード設定
* etc/default/keyboard

## Shell scripts
### SandS.sh
xcape環境でSandSを可能にする。
* home/bin/SandS.sh

# TODO
init.elのcask化など

# old contents
below files aren't configured moreover

## URxvt関連
標準的設定、コピペとかURLクリックが上手く動かなくて投げた
* home/.Xdefaults

## conky
バッテリー表示のあるノート限定版。デスクトップ版の必要性を感じる前にawesomeに移行しつつあった。
移行した
* home/.conkyrc

## fluxbox
使おうと思って書き始めたけど投げた
* home/.fluxbox/styles/maccha_tea/theme.cfg
