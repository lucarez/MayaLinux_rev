#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_maze checking completion" >&2 ; fi

#
# Check the level
#

# no check needed
export lvls="yes"

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_maze completed\nrequesting build of $next" >&2 ; fi

next="`cat $data_path/implementations/$lang/$theme/level_maze/next`"
. $data_path/core/buildlevel.sh $next

