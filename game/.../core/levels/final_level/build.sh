#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level builder started" >&2 ; fi

#
# Build the level
#

ln -f $data_path/core/levels/final_level/complete.sh $player_path/$action.sh
ln -f $data_path/implementations/$lang/$theme/final_level/instructions.txt $player_path/$readme.txt

if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level built" >&2 ; fi

