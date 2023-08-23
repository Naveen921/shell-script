#!/bin/bash

#this can hold multipole values instead of single value
PERSONS=("Naveen""Venu""Puri")

echo "The name of a first person is : ${PERSONS[0]}"

echo "All persons names : ${PERSONS[@]}"