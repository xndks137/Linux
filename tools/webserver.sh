#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <httpd|nginx>"
    exit 1 
fi

systemctl is-active nginx >/dev/null 2>&1 ; Nactive=$?
systemctl is-active httpd >/dev/null 2>&1 ; Hactive=$?
systemctl is-enable nginx >/dev/null 2>&1 ; Nenable=$?
systemctl is-enabled httpd >/dev/null 2>&1 ; Henable=$?
WEBTYPE=$1

HTTPD() {
    if [ $Nactive -eq 0 ] ; then
        systemctl disable --now nginx >/dev/null 2>&1
    elif [ $Nenable -eq 0 ] ; then
        systemctl disable --now nginx >/dev/null 2>&1
    elif [ $Henable -eq 0 ] && [ $Hactive -eq 3 ]; then
        systemctl start httpd >/dev/null 2>&1
        echo "[ 완료 ] 서비스 기동" ; exit 1
    elif [ $Hactive -eq 0 ] ; then
        echo "서비스가 이미 작동 중 입니다."
        exit 1
    fi
    /root/tools/httpd.sh
}

NGINX() {
    if [ $Hactive -eq 0 ] ; then
        systemctl disable --now httpd >/dev/null 2>&1
    elif [ $Henable -eq 0 ] ; then
        systemctl disable --now httpd >/dev/null 2>&1
    elif [ $Nenable -eq 0 ] ; then
        systemctl start nginx >/dev/null 2>&1
        echo "[ 완료 ] 서비스 기동" ; exit 1
    elif [ $Nactive -eq 0 ] ; then
        echo "서비스가 이미 작동 중 입니다."
        echo ; exit 1
    fi
    /root/tools/nginx.sh
}

ERROR() {
    echo "$WEBTYPE is httpd or nginx"
    exit 2
}

case $WEBTYPE in
    'httpd') HTTPD ;;
    'nginx') NGINX ;;
    *) ERROR ;;
esac
