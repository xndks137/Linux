#!/bin/bash

WINSERVER=192.168.10.128
PORT=21

ftp -n $WINSERVER $PORT << EOF
user user01 user01
cd test
lcd /test
bin
hash
prompt
mput linux217.txt
quit
EOF
