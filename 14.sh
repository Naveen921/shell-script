#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

VALIDATE(){
 if [ $1 -ne 0 ]
 then
    echo -e "$R Installing $2 .........ERROR $N"
    exit 1
 else 
    echo -e "$G Installing $2 .........SUCCESS $N"
fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
 then
    echo -e "$R ERROR:: Procced with ROOT access $N"
    exit 1
fi

for i in  $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
     then
        echo "$i is not installed,let's install it"
        yum install $i &>>$LOGFILE
        VALIDATE $? "$i"
     else
        echo -e "$Y $i is already installed $N"
    fi
done