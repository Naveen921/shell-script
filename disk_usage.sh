#!/bin/bash

DATE=$(date +%F:%H:%M:%S)
LOGFILE_DIRECTORY=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
message=""

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1

#IFS= means internal field seperation is space
while IFS= read line 
do
    #this command will give you usage in number formate to compare
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    #this command will give you partition
    partition=$(echo $line | awk '{print $1}')
    #check wheather greaterthen or not
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then 
        message+="HIGH DISK USAGE ON $partition: $usage \n"
    fi
done <<< $DISK_USAGE
      echo "message: $message"
      echo "$message" | mail -s "HARD DISK USAGE" naninani35678@gmail.com