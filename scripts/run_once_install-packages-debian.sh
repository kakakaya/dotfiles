#!/bin/bash
set -euo pipefail

PKGLIST="$HOME/.config/packages/pkglist-debian.txt"

sudo apt update
xargs -a "$PKGLIST" sudo apt install -y
