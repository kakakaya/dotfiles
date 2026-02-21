#!/bin/bash
set -euo pipefail

PKGLIST="$HOME/.config/packages/pkglist.txt"
PKGLIST_AUR="$HOME/.config/packages/pkglist-aur.txt"

# 公式パッケージのインストール
sudo pacman -S --needed --noconfirm - < "$PKGLIST"

# AURヘルパーの検出（yay → paru の順）
AUR_HELPER=""
if command -v yay &>/dev/null; then
  AUR_HELPER="yay"
elif command -v paru &>/dev/null; then
  AUR_HELPER="paru"
fi

# AURパッケージのインストール
if [ -n "$AUR_HELPER" ]; then
  $AUR_HELPER -S --needed --noconfirm - < "$PKGLIST_AUR"
else
  echo "AURヘルパーが見つかりません。AURパッケージのインストールをスキップします。"
fi
