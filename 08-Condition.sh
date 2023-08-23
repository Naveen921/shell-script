#!/bin/bash

#check wheater the number entered by user is greater than 10
NUMBER=$1
if [ $NUMBER -gt 10 ]
 then
   echo "$NUMBER is greater then 10"
else
   echo "$NUMBER is not greater then 10"
fi