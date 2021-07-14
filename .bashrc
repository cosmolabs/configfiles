#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Adding bin files from user's home directory
if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d" ] ;
  then PATH="$PATH:$HOME/.emacs.d/bin"
fi

# Displays system info
# Fetching the script from user's bin folder
if [ -f "$HOME/.local/bin/hfetch" ] ; then 
	clear && hfetch 
fi

# Linking aliases file
if [ -f "$HOME/.local/bin/bash_aliases" ] ; then
	. $HOME/.local/bin/bash_aliases
fi

# Default editor
export EDITOR='vim'
export VISUAL='vim'

#### Shell prompt ###
#### Begin ####
SELECT(){
  if [ "$?" -eq 0 ]
    then
    echo "";
  else
    echo -e "\n " ; echo -e "[X] - $?" ; echo -e "\n " ;
  fi
}

COLOR_BLACK="\[$(tput setaf 0)\]"
COLOR_RED="\[$(tput setaf 1)\]"
COLOR_GREEN="\[$(tput setaf 2)\]"
COLOR_YELLOW="\[$(tput setaf 3)\]"
COLOR_BLUE="\[$(tput setaf 4)\]"
COLOR_PURPLE="\[$(tput setaf 5)\]"
COLOR_CYAN="\[$(tput setaf 6)\]"
COLOR_WHITE="\[$(tput setaf 7)\]"
COLOR_BLUE="\[$(tput setaf 8)\]"
COLOR_RESET="\[$(tput sgr0)\]"
COLOR_BOLD="\[$(tput bold)\]"

PS1="
[ ${COLOR_GREEN}\h${COLOR_RESET} ] - ${COLOR_RESET}\\w ${COLOR_RESET}${COLOR_YELLOW}\$(precmd)${COLOR_RESET}
${COLOR_BOLD}>${COLOR_RESET} "
#[${COLOR_BOLD}${COLOR_PURPLE}\u : ${COLOR_GREEN}\h${COLOR_RESET}] - ${COLOR_RESET}\\W ${COLOR_RESET}${COLOR_YELLOW}\$(precmd)${COLOR_RESET}
#${COLOR_BOLD}:${COLOR_RESET} "


if [ -f "$HOME/.local/bin/git-prompt.bash" ] ; then 
	. $HOME/.local/bin/git-prompt.bash
fi

precmd() {
    echo `git_prompt_precmd`
}

#### End ####

##### Functions #####
##### Begin #####

# extract = Extractor for all kinds of archives
# usage: extract <filepath>
function extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

##### End #####
##### Functions #####

##### Arch linux - commands #####
##### Begin #####

function pac_orph ()
{
	echo -e "\nOrphans : pacman -Qdt" # prints out orphans with their versions.
								 # use pacman -Qqdt for orphans with out version.
	echo ""
	pacman -Qdt	
}

function rm_pac_orph ()
{
	echo -e "\nRemove Orphans : pacman -Rsn soruced with pacman -Qqdt"
	echo ""
	sudo pacman -Rsn $(pacman -Qqdt)
}
function audio_wave_form()
{
    if [[ $# == 2 ]]
    then
        ffmpeg -i $1 -filter_complex "[0:a]showwaves=s=1280x720:colors=Blue|White:mode=line:rate=25,format=yuv420p[v]" -map "[v]" -map 0:a $2
    else
        echo -e "\nFunction accepts 2 parameters a path to audio file and a path to store video file."
    fi
}

function audio_wave_form_with_colors()
{
    if [[ $# == 2 ]]
    then
        ffmpeg -i $1 -filter_complex "[0:a]showwaves=s=1280x720:mode=cline:rate=25,format=yuv420p[v]" -map "[v]" -map 0:a -c:v libx264 -c:a copy $2
    else
        echo -e "\nFunction accepts 2 parameters a path to audio file and a path to store video file."
    fi
}
##### End #####
##### Arch linux - commands #####
