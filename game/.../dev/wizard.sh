#!/bin/bash
clear
cd "$(dirname "$0")"

wizards=( $(find * -prune -type d -exec printf "{} " \;) )
options=()
#echo ${#options[@]}
#echo ${options[@]}
#echo ${options[0]}
#echo ${options[1]}
#noptions=$((${#options[@]}-1))
for ((i=0; i < ${#wizards[@]} ; i++))
do
  options+=("$(cat ${wizards[i]}/description.txt)")
done

echo -e "Welcome to the wizard builder\n\nWhat do you want to do?"
PS3='Please enter your choice: '
options+=("Quit")
select opt in "${options[@]}"
do
    case $opt in
#        "${options[0]}")
#            echo "you chose: ${options[0]}"
#            ;;
#        "${options[1]}")
#            echo "you chose: ${options[1]}"
#            ;;
#        "${options[2]}")
#            echo "you chose: ${options[2]}"
#            ;;
        "Quit")
            exit
            ;;
        *)
            for ((i=0; i<${#wizards[@]} ; i++))
            do
              if [ "$opt" = "${options[i]}" ]
                then
                  ${wizards[i]}/wizard.sh
                  exit
              fi
            done
            echo invalid option
            exit 1
            ;;
    esac
done
