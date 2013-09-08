#!/bin/bash

if [ ! -z $mayalinuxDebug ] ; then echo -e "runlevel.sh started" >&2 ; fi

# If runned with no level sets the and run the first level
if [ "$#" -eq "0" ]
  then
    level="$(cat $data_path/$theme/start)"
  else
    level="$1"
fi

#
# Clear previous level
#

cd $game_root
find -x {,.}* -prune  \! \( -name "mayalinux" -or -name "..." -or -name ".." -or -name "." \) -exec rm -rf {} \;


#
# Check for cheater
#

if [ ! -z $mayalinuxDebug ] ; then echo -e "Checking for cheater" >&2 ; fi

status="$($core_path/anticheat/check.sh $level)"
. $core_path/anticheat/check.sh $level &> /dev/null
if [ "$status" -gt "1" ]
  then
    echo $cheater
    echo $press_enter
    read
    if [ ! -z $mayalinuxDebug ] ; then echo -e "Cheater found, bringing him to the first level" >&2 ; fi
    level="$(cat $data_path/$theme/start)"
    . $core_path/anticheat/check.sh $level &> /dev/null
fi


#
# Build the level
#

if [ ! -z $mayalinuxDebug ] ; then echo -e "Building level $level" >&2 ; fi

export level_path="$data_path/$theme/$level"
export playing_path="$game_root/$($core_path/utils/getPlayingDir.sh $level)"
export challenge="$($core_path/utils/getChallengeDir.sh $level)"
export challenge_path="$core_path/challenges/$challenge"
mkdir $playing_path
. $challenge_path/build.sh

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level built\nRunning level" >&2 ; fi

#
# Start the level
#

clear
if [ "$status" -eq "1" ]
  then
    cat $level_path/retry.txt 2> /dev/null
    if [ ! "$?" = "0" ]; then cat $level_path/intro.txt; fi
  else
    if [ "$2" = "failed" ]
      then
        cat $level_path/intro4loser.txt 2> /dev/null
        if [ ! "$?" = "0" ]; then cat $level_path/intro.txt; fi
      else
        cat $level_path/intro.txt
    fi
fi
cd $playing_path

if [ ! -z $mayalinuxDebug ] ; then echo -e "Level ran\nExiting runlevel.sh" >&2 ; fi

