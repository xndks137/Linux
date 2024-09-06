#!/bin/bash

source /root/tools/function.sh

# (ㄱ) 로컬 IP로 테스트
IP1=192.168.10.2
print_info "ping $IP1"
ping $IP1 -c 1 -w 1 >/dev/null 2>&1 ;
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] Local Network Connection"
else
    print_error "[ FAIL ] Local Network Connection"
    cat << EOF
    (ㄱ) VMware >  Edit > Virtual Network Editor
    (ㄴ) VMware > VM > Settings > Network Adapter
    (ㄷ) # ifconfig 
EOF
fi
echo
# (ㄴ) 외부 IP로 테스트
IP2=8.8.8.8
print_info "ping $IP2"
ping $IP2 -c 1 -w 1 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] External Network Connection"
else
    print_error "[ FAIL ] External Network Connection"
    cat << EOF
    (ㄱ) # ip route
EOF
fi
echo
# (ㄷ) 외부 이름으로 테스트
IP3=www.google.com
print_info "ping $IP3"
ping -c 1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good "[  OK  ] Domain name query"
else
    print_error "[ FAIL ] Domain name query"
    cat << EOF 
    (ㄱ) # cat /etc/resolv.conf
EOF
    exit 3
fi
echo