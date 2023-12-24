#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "$R Source File: $file doesn't exists $N"
fi
while IFS=":" read -r username password user_id user_fullname home_dir shell_path
do 
    echo "username: $username"
    echo "userid: $user_id"
    echo "userfullname: $user_fullname"
done < $file