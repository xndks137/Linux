#!/bin/bash

NET=192.168.10
SERVER=/root/tools/aliveserver.list

Cmd() {
	sleep 2 ; echo 'root'
	sleep 1 ; echo 'centos'
	sleep 1 ; echo 'reboot'
	sleep 1 ; echo 'exit'
}

> $SERVER

for i in $(seq 10 20 30)
do
    ping "$NET.$i" -c 1 >/dev/null 2>&1
    if [ $? -eq 0 ] ; then echo "$NET.$i" >> $SERVER ; fi
done

cat << EOF
살아 있는 서버 목록
-----------------------
$(cat $SERVER)
-----------------------
EOF
echo
cat $SERVER | while read server
do
    echo "====$server 재부팅 시작======="
    Cmd | ssh $server >/dev/null 2>&1
    echo "====$server 재부팅 완료======="
done
