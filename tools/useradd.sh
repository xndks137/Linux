#!/bin/bash


user=/root/tools/user.list

cat $user | while read uname upass
do
    useradd $uname >/dev/null 2>&1
    [ $? -eq 0 ] \
    && echo "[ OK ]$uname" \
    || echo "[ FAIL ]$uname"
    echo "$upass" | passwd --stdin "$upass" >/dev/null 2>&1
done