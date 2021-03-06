#!/bin/bash
while [[ True ]]
do
    echo "--------------------------------------"
    echo "1 for entering first name "
    echo "2 for entering last name"
    echo "3 for entering email"
    echo "4 for entering phone number"
    echo "5 for entering password"
    echo "6 for exit"
    read -p "enter your option:" option
    read -p "enter your input:" input
    
    case $option in 
        1 | 2)
            #it should start with capital letter and
            #has minimum 3 characters
            pattern="^[A-Z][a-zA-Z]{2,}$"
            echo -n "given name "
            ;;
        3)
            #abc.xyz@bl.co.in
            #email has 3 mandatory parts(abc,bl&co) and 2 optional
            #(xyz & in ) with precise @ and . postions
            pattern="^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[0-9a-zA-Z]+.[a-zA-Z]{2,4}+([.][a-zA-Z]{2,3})?$"
            echo -n "given email "
            ;;
        4)
            #phonenumber have country code and 10
            #digits with space seperated
            #country code can have 1 to 6 digits
            pattern="^[0-9]{1,6}\s[0-9]{10}$"
            echo -n "given phone number "
            ;;
        5)
            #password minimum lenth 8
            #atleast have 1 uppercase letter
            #atleast have 1 number
            #atleast have 1 special symbol
            pattern="(?=.*[A-Z])(?=.*[0-9])(?=.*[*.!@$%^&(){}[\]:;<>,.?\/~_+\-=|#]).{8,}"
            echo -n "given password "          
            ;;
        6)
            echo "exiting......"
            exit 2
            ;;
        *)
            echo "enter valid option"
            ;;
    esac

    if [[ $option =~ ^[12345]$ ]]
    then
            #since =~ doesn't support lookheads
            #grep is used with -P for perl
            #regex engine 
            result=$(echo $input | grep -P $pattern)
            if [ -z "${result}" ]
            then 
                echo "$input is not valid"; 
            else 
                echo "$input is valid";
            fi             
    fi
    
done 