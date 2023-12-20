#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
timestamp=$(date +%F-%H-%M-%S)
logfile="/tmp/$0-$timestamp.log"
echo "Script started executing at $timestamp" &>> $logfile

validate(){
    if [ $1 -ne 0]
    then 
        echo -e "$2...$R FAILED $N"
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error: Please run the script with root user $N"
else
    echo -e "$G You are the root user $N"
fi

for package in $@
do
    yum list installed $package &>> $logfile
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $logfile
        validate $? "Installation of $package"
    else
        echo -e "$package is already installed ..$Y skipping $N"
    fi
done
