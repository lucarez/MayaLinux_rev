#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "check.sh started\nAsking for '$1' from '$clvl'" >&2 ; fi

if [ "$#" -eq "1" ]
  then  
    # Check that you are on the right level
    if [ "$1" = "`cat $data_path/$theme/start`" ]
      then
        if [ -z $current_level ]
          then
            echo 0
          else
            echo 1
        fi
        export current_level="$1"
      else
        if [ ! "$data_path/$theme/$current_level" = "$level_path" ]
          then
            echo 3
          else
            if [ "$1" = "`cat $data_path/$theme/$current_level/succeeded`" -a "$level_succeeded" = "yes" ] || [ "$1" = "`cat $data_path/$theme/$current_level/fail`" ]
              then
                export current_level="$1"
                echo 0
              else
                if [ "$current_level" = "$1" ]
                  then
                    echo 1
                  else
                    echo 2
                fi
            fi
        fi
    fi
    export level_succeeded="no"
  else
    echo 3
fi

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting check.sh level:$1 clvl:$clvl" >&2 ; fi

