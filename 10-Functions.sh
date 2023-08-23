#!/bin/bash
#our goal is to insatll git

USERID=$(id -u)

VIDATE(){
    #$1-->it will recive the argument1 i.e. VALIDATE $?
    #$2-->it will recive the argument2 i.e. VALIDATE ($?) $2"
if [ $1 -ne 0 ]
then
    echo "$2 is.............. ERROR"
    exit 1
else
    echo "$2 is.............. Success"
fi    
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root user"
    exit 1
fi

yum install git -y
VALIDATE $? "Insatlling git"

yum install mysql -y
VALIDATE $? "Installing mysql"

