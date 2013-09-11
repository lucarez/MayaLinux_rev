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

# Create the dead_ends
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

# Delete dead_end messages in not dead_end locations
for i in $(find $playing_path -type f)
  do
    if [ ! -z $mayalinuxDebug ] ; then echo -e "file: $i:$(dirname $i):$playing_path" >&2 ; fi
    test "$(dirname $i)" != "$playing_path" &&
      test "$(ls -l `dirname $i` | grep -e "^d" | wc -l)" -gt "0" &&
        rm $i
done

# Create the exit
maze_end $f/$r/$l/$r/$f/$f/$f/$r/$l

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_maze built" >&2 ; fi

