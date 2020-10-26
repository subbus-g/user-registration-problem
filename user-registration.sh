#!/bin/bash
while [[ True ]]
do
    echo "--------------------------------------"
    echo "1 for entering first name "
    echo "2 for entering last name"
    echo "3 for entering email"
    echo "4 for entering phone number"
    echo "5 for exit"
    read -p "enter your option:" option
    
    case $option in 
        1 | 2)
            #it should start with capital letter and
            #has minimum 3 characters
            pattern="^[A-Z][a-zA-Z]{2,}$"
            ;;
        3)
            #abc.xyz@bl.co.in
            #email has 3 mandatory parts(abc,bl&co) and 2 optional
            #(xyz & in ) with precise @ and . postions
            pattern="^[a-z]{3,}(.[a-z]*)?@([a-z]){2,}.[a-z]+(.in)*"
            ;;
        4)
            #phonenumber have country code and 10
            #digits with space seperated
            #country code can have 1 to 6 digits
            pattern="^[0-9]{1,6}\s[0-9]{10}$"
            ;;
        5)
            echo "exiting......"
            exit
            ;;
        *)
            echo 'enter valid option'
            ;;
    esac

    if [[ $option =~ ^[1234]$ ]]
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