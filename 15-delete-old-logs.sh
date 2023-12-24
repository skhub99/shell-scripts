#!/bin/bash
source_dir=/tmp/shellscripts-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $source_dir ]
then
    echo -e "$R Source Directory: $source_dir doesn't exists $N"
fi

files_to_delete=$(find $source_dir -type f -mtime +14 -name "*.log")
while IFS= read -r line
do
    echo "deleting file: $line"
done <<< $files_to_delete
