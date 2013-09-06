#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "getLevelDir.sh started\nretrieving dir for '$1'" >&2 ; fi
if [ ! "$#" -eq "1" -o ! -f "$data_path/$lang/$theme/$1/level_dir" ]
  then
    echo "$1"
  else
    temp_level_dir="`cat $data_path/$lang/$theme/$1/level_dir`"
    set -- $temp_level_dir
    echo "$1"
fi

if [ ! -z $mayalinuxDebug ] ; then echo -e "Dir:$1\nExiting getLevelDir.sh" >&2 ; fi

