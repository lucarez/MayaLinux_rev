#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "check.sh started\nAsking for '$1' from '$clvl'" >&2 ; fi

if [ "$#" -eq "1" ]
  then  
    # Check that you are on the right level
    if [ "$1" = "`cat $data_path/$lang/$theme/start`" ]
      then
        export clvl="$1"
        echo 0
      else
        if [ "$1" = "`cat $data_path/$lang/$theme/$clvl/next`" -a "$lvls" = "yes" ]
          then
            export clvl="$1"
            echo 0
          else
            if [ "$clvl" = "$1" ]
              then
                echo 0
              else
                echo 1
            fi
        fi
    fi
    export lvls="no"
  else
    echo 2
fi

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting check.sh level:$1 clvl:$clvl" >&2 ; fi

