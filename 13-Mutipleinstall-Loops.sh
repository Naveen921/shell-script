#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=(id -u)
if [$USERID -ne 0]
then
    echo -e "$R ERROR:: Procced with ROOT access $N"
    exit 1
fi

for i in  $@
do
    yum install $i -y
done