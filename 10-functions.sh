#!/bin/bash
ID=$(id-u)
validate(){
    if [ $? -ne 0 ]
    then 
        echo "Error-The installation is failed"
        exit 1
    else
        echo "The installation is success"
    fi
}

if [ $ID -ne 0 ]
then 
    echo "Please run the script with root user"
    exit 1
else
    echo "You are the root user"
fi
yum install mysql -y
validate
yum install git -y
validate