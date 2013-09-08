#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level checking completion" >&2 ; fi

#
# Check the level
#

finaltime="`date +%s`"

find='find * -type f \! \( -name "$action.sh" -or -name "$readme.txt" \)'

n="$(eval "$find | wc -l")"

if [ ! "$n" -eq "1" ]
  then
    cat $level_path/error.txt
    eval "$find -exec rm {} \;"
  else
    name="$(eval "$find -exec echo {} \;")"
    let elapsedtime=$finaltime-$starttime
    if [ ! -d $score_path ]
      then
        mkdir -p $score_path
    fi
    cat $level_path/score.txt
date -d "@$elapsedtime" "+%H:%M:%S" # date -j -f "%s" "$elapsedtime" "+%M:%S" # <- MacOS version #### date -d "@$elapsedtime" "+%H:%M:%S" # <- Linux version
    echo "$name:$elapsedtime:`date +%Y`" > $score_path/$name.$finaltime
    cat $level_path/goodbye.txt
    read
    if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level completed\nexiting" >&2 ; fi
    exit
fi

