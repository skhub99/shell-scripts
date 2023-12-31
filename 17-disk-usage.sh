#!/bin/bash
disk_usage=$(df -hT | grep -vE 'tmp|file')
disk_threshold=1
message=""
while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $disk_threshold ]
    then 
        message+="high disk usage on $partition: $usage\n"
    fi
done <<< $disk_usage
echo -e "message: $message"
echo  "$message" | mail -s "High Disk Usage" vasumayeee.99@gmail.com
