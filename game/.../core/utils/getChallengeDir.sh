#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "getLevelDir.sh started\nretrieving dir for '$1'" >&2 ; fi

if [ ! -f "$level_path/challenge" ]
  then
    echo "$(basename $level_path)"
  else
    temp_level_dir="`cat $level_path/challenge`"
    set -- $temp_level_dir
    echo "$1"
fi

if [ ! -z $mayalinuxDebug ] ; then echo -e "Dir:$1\nExiting getLevelDir.sh" >&2 ; fi

