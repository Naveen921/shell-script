#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

DATE=$(date +%F)
LOGDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log

VALIDATE()
{
 if [ $1 -ne 0]
 then
    echo -e "$R Installing $2.........ERROR $N"
 else 
    echo -e "$G Installing $2.........SUCCESS $N"
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
    if [ $? -ne 0]
    then
        echo -e "$i is not installed,let us install now"
        yum install $i &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done