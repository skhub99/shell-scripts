#!/bin/bash
Number=$1
if [ $Number -gt 100 ]
then
    echo " The given number is: $Number And is greater than 100 "
else
    echo " The given number is: $Number And is not greater than 100 "
fi