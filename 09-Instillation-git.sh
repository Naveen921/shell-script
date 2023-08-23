#!/bin/bash
#our goal is to insatll git

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root user"
    exit 1
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "Instillation of git is ERROR"
    exit 1
else
    echo "Instillation of git is Success"
fi    

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Instillation of mysql is ERROR"
    exit 1
else
    echo "Instillation of mysql is Success"
fi    

