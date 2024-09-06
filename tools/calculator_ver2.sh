#!/bin/bash

echo -n "Enter A : "
read a
echo -n "Enter Operator : "
read op
echo -n "Enter B : "
read c

case $op in
    '+') echo "$a + $c = $(expr $a + $c)" ;;
    '-') echo "$a - $c = $(expr $a - $c)" ;;
    '*') echo "$a * $c = $(expr $a \* $c)" ;;
    '/') echo "$a / $c = $(expr $a / $c)" ;;
    *) echo "fail" && exit 1 ;;
esac