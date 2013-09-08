#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "run.sh started" >&2 ; fi

#
# Search for avaiable game
#

## TODO retrieve avaiable games & let choose what to play ##
              PS3='Please enter your choice: '
              options=("Italiano" "English" "Quit")
              select opt in "${options[@]}"
              do
                  case $opt in
                      "Italiano")
                          export lang="it"
                          break
                          ;;
                      "English")
                          export lang="en"
                          break
                          ;;
                      "Quit")
                          exit
                          ;;
                      *) 
                          echo invalid option
                          exit
                          ;;
                  esac
              done
              #export lang="it"
              export theme="monkey_island"
############################################################

if [ ! -z $mayalinuxDebug ] ; then echo -e "Setting global variables" >&2 ; fi

export game_root="`pwd`"
export data_path="$game_root/.../implementations/$lang"
export core_path="$game_root/.../core"
export build_next=". $core_path/buildnext.sh"
export score_path="$game_root/.../winners/$lang/$theme"

old_ps1=$PS1
## TODO retrieve single fields: color, name, title,... and build all in this file ##
. $data_path/$theme/display_settings
####################################################################################
. $data_path/commons/lang_pack

#
# Anticheat check command
#

export PROMPT_COMMAND=". $core_path/anticheat/cd"

if [ ! -z $mayalinuxDebug ] ; then echo -e "Global variables set" >&2 ; fi

function print_and_wait {
  clear
  cat $1
  echo $press_enter
  read
}

if [ ! -z $mayalinuxDebug ] ; then echo -e "Printing credits" >&2 ; fi

print_and_wait $data_path/$theme/title.txt
print_and_wait $data_path/commons/author.txt
print_and_wait $data_path/commons/rules.txt

export starttime="`date +%s`"

if [ ! -z $mayalinuxDebug ] ; then echo -e "Credits printed\nBuilding first level" >&2 ; fi

. $core_path/buildlevel.sh 

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level built and ran" >&2 ; fi


#answer="$no"
#
#while [ "$answer" = "$no" -o "$answer" = "${no:0:1}" ] ; do
if [ ! -z $mayalinuxDebug ] ; then echo -e "Running shell" >&2 ; fi
/bin/bash --init-file $core_path/game_alias.sh
if [ ! -z $mayalinuxDebug ] ; then echo -e "Shell exited" >&2 ; fi
#  answer="maybe"
#  while [ "$answer" != "$no" -a "$answer" != "${no:0:1}" -a "$answer" != "$yes" -a "$answer" != "${yes:0:1}" ] ; do
#    cat $data_path/commons/exiting.txt
#    read answer
#    answer=`echo "$answer" | tr [:upper:] [:lower:]`
#  done
#done

export PS1=$old_ps1

if [ ! -z $mayalinuxDebug ] ; then echo -e "Exiting run.sh" >&2 ; fi

