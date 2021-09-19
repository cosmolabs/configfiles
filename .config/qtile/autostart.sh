#!/usr/bin/bash

# lxsession &
picom --config $HOME/.config/qtile/picom.conf &
# conky -c $HOME/.config/conky/doomone-qtile.conkyrc
# volumeicon &
# nm-applet &
feh --bg-fill --random /usr/share/backgrounds/arcolinux/ &
