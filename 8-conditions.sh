#!/bin/bash
Number=$1
if [ $Number -gt 100 ]
then
    echo " The given number: $Number is greater than 100 "
else
    echo " The given number: $Number is not greater than 100 "
fi