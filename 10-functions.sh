#!/bin/bash
ID=$(id -u)
validate(){
    if [ $1 -ne 0 ]
    then 
        echo "Error-The installation of $2 is failed"
        exit 1
    else
        echo "The installation of $2 is success"
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
validate $? "Mysql"
yum install git -y
validate $? "Git"