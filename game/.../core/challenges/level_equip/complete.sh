#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_equip checking completion" >&2 ; fi

#
# Check the level
#

# no check needed
export level_succeeded="yes"

if [ ! -z $mayalinuxDebug ] ; then echo -e "level_equip completed\nrequesting build of $next" >&2 ; fi

$build_next
