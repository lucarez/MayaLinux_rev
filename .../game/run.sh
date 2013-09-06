#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "run.sh started" >&2 ; fi

#
# Search for avaiable game
#

## TODO retrieve avaiable games & let choose what to play ##
              export lang="it"
              export theme="monkey_island"
############################################################

if [ ! -z $mayalinuxDebug ] ; then echo -e "Setting global variables" >&2 ; fi

export game_root="`pwd`"
export data_path="$game_root/..."

old_ps1=$PS1
## TODO retrieve single fields: color, name, title,... and build all in this file ##
. $data_path/$lang/$theme/display_settings
####################################################################################
. $data_path/$lang/commons/lang_pack

if [ ! -z $mayalinuxDebug ] ; then echo -e "Global variables set" >&2 ; fi

function print_and_wait {
  clear
  cat $1
  echo $press_enter
  read
}

if [ ! -z $mayalinuxDebug ] ; then echo -e "Printing credits" >&2 ; fi

print_and_wait $data_path/$lang/$theme/title.txt
print_and_wait $data_path/$lang/commons/author.txt
print_and_wait $data_path/$lang/commons/rules.txt

export starttime="`date +%s`"

if [ ! -z $mayalinuxDebug ] ; then echo -e "Credits printed\nBuilding first level" >&2 ; fi

. $data_path/game/buildlevel.sh 

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level built and ran" >&2 ; fi

#export PATH="$data_path/anticheat:$data_path/utils:$PATH"

#answer="$no"
#
#while [ "$answer" = "$no" -o "$answer" = "${no:0:1}" ] ; do
if [ ! -z $mayalinuxDebug ] ; then echo -e "Running shell" >&2 ; fi
/bin/bash --init-file $data_path/game/game_alias.sh
if [ ! -z $mayalinuxDebug ] ; then echo -e "Shell exited" >&2 ; fi
#  answer="maybe"
#  while [ "$answer" != "$no" -a "$answer" != "${no:0:1}" -a "$answer" != "$yes" -a "$answer" != "${yes:0:1}" ] ; do
#    cat $data_path/$lang/commons/exiting.txt
#    read answer
#    answer=`echo "$answer" | tr [:upper:] [:lower:]`
#  done
#done

export PS1=$old_ps1

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting run.sh" >&2 ; fi

