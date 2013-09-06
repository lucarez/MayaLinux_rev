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
    cat $data_path/implementations/$lang/$theme/final_level/error.txt
    eval "$find -exec rm {} \;"
  else
    name="$(eval "$find -exec echo {} \;")"
    let elapsedtime=$finaltime-$starttime
    if [ ! -d $data_path/winners/$lang/$theme ]
      then
        mkdir -p $data_path/winners/$lang/$theme
    fi
    cat $data_path/implementations/$lang/$theme/final_level/score.txt
date -j -f "%s" "123" "+%M:%S" #    date -d "@$elapsedtime" "+%H:%M:%S" 
    echo "$name:$elapsedtime:`date +%Y`" > $data_path/winners/$lang/$theme/$name.$finaltime
    cat $data_path/implementations/$lang/$theme/final_level/goodbye.txt
    read
    if [ ! -z $mayalinuxDebug ] ; then echo -e "final_level completed\nexiting" >&2 ; fi
    exit
fi

