#!/bin/bash

HOST=172.16.6.250
UNAME=root
UPASS=centos

CMD() {
    sleep 2; echo "$UNAME"
    sleep 1; echo "$UPASS"
    sleep 0.5; echo "hostname"
    sleep 0.5; echo "tar cvzf /tmp/linux217.tar.gz /home"
    sleep 4; echo "exit"
}
CMD | telnet $HOST

ftp -n $HOST 21 << EOF
user $UNAME $UPASS
cd /tmp
lcd /root
bin
hash
prompt
mget linux217.tar.gz
quit
EOF
