#!/usr/bin/bash
cat rmPacPkgs.list | grep -v "^#" > archPkgs_tmp.list
sudo pacman -Syu
sudo pacman -R - < ./archPkgs_tmp.list
rm archPkgs_tmp.list
