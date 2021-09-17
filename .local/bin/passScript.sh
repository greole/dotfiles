#!/bin/bash

shopt -s nullglob globstar

# switch for autotyping
typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi
otp=0
if [[ $1 == "--otp" ]]; then
    otp=1
    shift
fi

# get all the saved password files
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

# shows a list of all password files and saved the selected one in a variable
password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" )
[[ -n $password ]] || exit


# pass -c copied the password in clipboard. The additional output from pass is piped in to /dev/null 
if [[ $typeit -eq 0 ]]; then
    pass show -c "$password" | head -n1  2>/dev/null
else
    # If i want to use autotype i save the user name and the password in to a variable 
    # the actual password files are simple text file. 
    # The password has to be on the first line,
    # because if you using `pass -i` the first line will be replaced with a new password

    passw=$(pass show $password | head -n1 )
    xdotool type "$passw"
fi
if [[ $otp -eq 1 ]]; then
    #pass otp -c "$password" | head -n1  2>/dev/null
    passw=$(pass otp $password | head -n1 )
    xdotool type "$passw"
fi
