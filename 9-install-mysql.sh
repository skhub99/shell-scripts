#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "The user is not the root user"
    exit 5
else
    echo " The user is the root user"
fi
yum install mysql -y