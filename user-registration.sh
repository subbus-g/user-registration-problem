#!/bin/bash
while [[ True ]]
do
    echo "--------------------------------------"
    echo "1 for entering first name "
    echo "5 for exit"
    read -p "enter your option:" option
    
    case $option in 
        1)
            pattern="^[A-Z][a-zA-Z]{2,}$"
            ;;
        5)
            echo "exiting......"
            exit
            ;;
        *)
            echo 'enter valid option'
            ;;
    esac

    if [[ $option =~ ^[1]$ ]]
    then
        read -p "enter your input:" input
        if [[ $input =~ $pattern ]]
        then
            echo "$input is valid"
        else
            echo "$input is not valid"
        fi
    fi
    
done 