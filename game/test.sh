#!/bin/bash

echo $0 $1 $2
echo "$(dirname "$0")"

PS3='Please enter your choice: '
options=("dog" "cat" "fish" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "${options[0]}")
            echo "you chose: ${options[0]}"
            ;;
        "${options[1]}")
            echo "you chose: ${options[1]}"
            ;;
        "${options[2]}")
            echo "you chose: ${options[2]}"
            ;;
        "${options[3]}")
            break
            ;;
        *) echo invalid option;;
    esac
done
