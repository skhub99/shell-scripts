#!/bin/bash
ID=$(id -u)
echo " Script Name $0 "
timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$timestamp.log"
echo "Script started executing at $timestamp " &>> $logfile
R="\e[31m"
G="\e[32m"
N="\e[0m"
validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "Error-The installation of $2 is $R Failed $N"
        exit 1
    else
        echo -e "The installation of $2 is $G Success $N"
    fi
}

if [ $ID -ne 0 ]
then 
    echo -e "$R Please run the script with root user $N"
    exit 1
else
    echo -e "$G You are the root user $N"
fi
yum install mysql -y &>> $logfile
validate $? "Mysql"
yum install git -y &>> $logfile
validate $? "Git"