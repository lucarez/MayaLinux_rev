#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_maze builder started" >&2 ; fi

#
# Build the level
#

eval "$(cat $level_path/directions)"

function dead_end {
  mkdir -p $playing_path/$1
  ln -f $level_path/dead_end.txt $playing_path/$1/$readme.txt
}

function maze_end {
  mkdir -p $playing_path/$1
  ln -f $level_path/end_instructions.txt $playing_path/$1/$readme.txt
  ln -f $challenge_path/complete.sh $playing_path/$1/$action.sh
}

ln -f $level_path/begin_instructions.txt $playing_path/$1/$readme.txt

dead_end $f/$f/$f/$r/$f/$l
dead_end $f/$f/$f/$r/$l/$r
dead_end $f/$f/$f/$r/$l/$l
dead_end $f/$f/$f/$l
dead_end $f/$f/$r
dead_end $f/$f/$l/$r
dead_end $f/$r/$f/$r
dead_end $f/$r/$f/$l
dead_end $f/$r/$l/$r/$f/$f/$f/$r/$r
dead_end $f/$r/$l/$r/$f/$f/$r
dead_end $f/$r/$l/$r/$f/$r
dead_end $f/$r/$l/$r/$f/$l
dead_end $f/$r/$l/$r/$r
dead_end $f/$r/$l/$l

maze_end $f/$r/$l/$r/$f/$f/$f/$r/$l

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_maze built" >&2 ; fi

