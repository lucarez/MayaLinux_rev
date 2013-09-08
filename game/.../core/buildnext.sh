#!/bin/bash

if [ "$level_succeeded" = "yes" ]
  then
    next="$(cat $level_path/succeeded)"
    . $core_path/buildlevel.sh $next succeeded
  else
    next="$(cat $level_path/failed)"
    . $core_path/buildlevel.sh $next failed
fi
