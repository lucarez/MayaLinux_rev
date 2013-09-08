#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level builder started" >&2 ; fi

#
# Build the level
#

ln -f $challenge_path/complete.sh $playing_path/$action.sh
ln -f $level_path/instructions.txt $playing_path/$readme.txt

if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level built" >&2 ; fi

