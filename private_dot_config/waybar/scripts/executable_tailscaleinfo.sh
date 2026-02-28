#!/bin/bash

set -eEuo pipefail

# Set your hostname in the appropriate file
# disable in waybar if not needed

if ! command -v tailscale &> /dev/null
then
    echo "tailscale could not be found"
    exit
fi

hostname="$(cat /etc/hostname)"

ip=$(tailscale ip -4 "$hostname")
status=$(tailscale status | grep $hostname | rev | cut -d' ' -f1 | rev)

css_class=green

if [ "$status" = "offline" ]; then
	css_class=red
	printf '{"text": "%s: %s  ", "alt": " ", "tooltip": " ", "class": "%s"}' "$hostname" "$ip" "$css_class"
else
	printf '{"text": "%s: %s  ", "alt": " ", "tooltip": " ", "class": "%s"}' "$hostname" "$ip" "$css_class"
fi
