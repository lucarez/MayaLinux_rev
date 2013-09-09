#!/bin/bash

if [ "$level_succeeded" = "yes" ]
  then
    if [ condition ]
      then
        next="$(cat $level_path/succeeded)"
      else
        next="$(cat $level_path/next)"  # for backward compatibility (deprecated?)
    fi
    
    . $core_path/buildlevel.sh $next succeeded
  else
    if [ -f "$level_path/failed" ]
      then
        next="$(cat $level_path/failed)"
      else
        next="$(basename $level_path)"
    fi
    . $core_path/buildlevel.sh $next failed
fi
