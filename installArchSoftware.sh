#!/usr/bin/bash
cat archPkgs.list | grep -v "^#" > archPkgs_tmp.list
doas pacman -Syu
doas pacman -S --needed - < ./archPkgs_tmp.list
rm archPkgs_tmp.list
