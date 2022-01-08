#!/usr/bin/bash
cat archPkgs.list | grep -v "^#" > archPkgs_tmp.list
sudo pacman -Syu
sudo pacman -S --needed - < ./archPkgs_tmp.list
rm archPkgs_tmp.list
