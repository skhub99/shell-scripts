#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "The user is not the root user"
else
    echo " The use is the root user"
fi