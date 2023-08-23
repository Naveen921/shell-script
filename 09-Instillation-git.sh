#!/bin/bash
#our goal is to insatll git

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root user"
    exit 1
fi

yum install git -y