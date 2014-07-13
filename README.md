# What's this
@kakakayaのdotfilesいわゆる設定集。再配布禁止なものが混じってそうな問題は修正済み。……たぶん。

# Contents
## Emacs
かなーり良い感じに仕上がってる。各種アレコレ入れる必要がある。そのへんそのうちまとめる。
* home/.emacs.d/init.el

## zsh
同上。ただし個性強めなので使用時にはalias周辺は必見。
* home/.zlogout
* home/.zshenv
* home/.zshrc


## awesome
大体標準的？な設定をした。
* .config/awesome/rc.lua
* .config/awesome/themes/my-zenburn/theme.lua

## URxvt関連
標準的設定、まだコピペとかURLクリックは非対応
* home/.Xdefaults

## Xmodmap
普通のCaps化+自分の環境でtildaが消えた時の対策版。
* home/.Xmodmap

## conky
バッテリー表示のあるノート限定版。デスクトップ版の必要性を感じる前にawesomeに移行しつつある。
* home/.conkyrc

## .screenlayout
叩くと調整される。自分用。
* home/.screenlayout/Azurite_only.sh
* home/.screenlayout/Azurite_with_DELL.sh

## fluxbox
使おうと思って書き始めたけど投げた
* home/.fluxbox/styles/maccha_tea/theme.cfg

## xsession
普通のawesome向け設定+学内で自動的にプロキシ設定する設定があった……けど
書いてる時点ではgit死亡の件で消えてる。というかzshenvに書くべきでは
* home/.xsession

## SandS.sh
xcape前提、SandSを可能にする。
* home/bin/SandS.sh

## zshexec.sh
起動後の表示をする、というかMOTD自分用というスタンス
home/bin/zshexec.sh

# TODO
個人情報が混じってないか確認するためのテストを書きたい。シェルスクリプトでgrepするだけの書いてこのdotfilesに追加すれば完璧!

