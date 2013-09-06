#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "runlevel.sh started" >&2 ; fi

# If runned with no level sets the and run the first level
if [ "$#" -eq "0" ]
  then
    level="`cat $data_path/implementations/$lang/$theme/start`"
  else
    level="$1"
fi

#
# Clear previous level
#
$real_cd $game_root
find -x {,.}* -prune  \! \( -name "mayalinux" -or -name "..." -or -name ".." -or -name "." \) -exec rm -rf {} \;

#
# Check for cheater
#

if [ ! -z $mayalinuxDebug ] ; then echo -e "Checking for cheater" >&2 ; fi


cheat="$($data_path/core/anticheat/check.sh $level)"
. $data_path/core/anticheat/check.sh $level &> /dev/null
if [ ! "$cheat" -eq "0" ]
  then
    echo $cheater
    echo $press_enter
#   echo "Nice try, but you have to try harder to cheat at this game\nPress Enter to continute"
    read
    if [ ! -z $mayalinuxDebug ] ; then echo -e "Cheater found, bringing him to the first level" >&2 ; fi
    level="`cat $data_path/implementations/$lang/$theme/start`"
    . $data_path/core/anticheat/check.sh $level &> /dev/null
fi


#
# Build the level
#

if [ ! -z $mayalinuxDebug ] ; then echo -e "Building level $level" >&2 ; fi

export player_path="$game_root/$($data_path/core/utils/getLevelDir.sh $level)"
mkdir $player_path
source $data_path/core/levels/$level/build.sh

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level built\nRunning level" >&2 ; fi

#
# Start the level
#

clear
cat $data_path/implementations/$lang/$theme/$level/intro.txt
$real_cd $player_path

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level ran\nExiting runlevel.sh" >&2 ; fi

