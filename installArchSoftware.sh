#!/usr/bin/bash

doas pacman -Syu
doas pacman -S --needed - < ./pkgs.list
