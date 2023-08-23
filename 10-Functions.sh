#!/bin/bash
#our goal is to insatll git
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    #$1-->it will recive the argument1 i.e. VALIDATE $?
    #$2-->it will recive the argument2 i.e. VALIDATE ($?) $2"
if [ $1 -ne 0 ]
then
    echo "$2 is.............. $R ERROR $N"
    exit 1
else
    echo "$2 is.............. $G Success $N"
fi    
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root user"
    exit 1
fi

yum install git -y &>>$LOGFILE
VALIDATE $? "Insatlling git"

yum install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

