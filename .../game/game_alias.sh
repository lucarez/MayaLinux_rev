#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "Started game_aliases.sh" >&2 ; fi

#
# Game aliases
#

alias echo="echo -e"
alias $instructions="cat $data_path/$lang/commons/rules.txt"
alias $action=". $action.sh"
alias $readme="cat $readme.txt"

#
# Anticheat aliases
#

alias cat="$data_path/game/anticheat/cat"
export real_cat="`which cat`"
#alias ls="$data_path/game/anticheat/ls"
#export real_ls="`which ls`"
#alias cd="$data_path/game/anticheat/cd"
#export real_cd="`which cd`"


if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting game_aliases.sh" >&2 ; fi

