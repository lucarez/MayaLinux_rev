#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "Started game_aliases.sh" >&2 ; fi

#
# Game aliases
#

alias echo="echo -e"
alias $instructions="cat $data_path/commons/rules.txt"
alias $action=". $action.sh"
alias $readme="cat $readme.txt"

#
# Anticheat aliases
#

alias cat="$core_path/anticheat/cat"
export real_cat="`which cat`"

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting game_aliases.sh" >&2 ; fi
