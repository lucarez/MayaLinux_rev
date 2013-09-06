#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "Started game_aliases.sh" >&2 ; fi

#
# Game aliases
#

alias echo="echo -e"
alias $instructions="cat $data_path/implementations/$lang/commons/rules.txt"
alias $action=". $action.sh"
alias $readme="cat $readme.txt"

#
# Anticheat aliases
#

alias cat="$data_path/core/anticheat/cat"
export real_cat="`which cat`"
#alias cd="$data_path/core/anticheat/cd"
#export real_cd="`which cd`"

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting game_aliases.sh" >&2 ; fi

