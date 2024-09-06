#!/bin/bash
set -e

# 패키지 설치
# - nginx
# - epel-release
# - boxes, cowsay
# 서비스 설정
# - /usr/share/nginx/html/index.html
# 서비스 기동
# systemctl restart nginx
# systemctl enable nginx

# (ㄱ)패키지 설치
echo "[ 시작 ] 패키지 설치"
dnf -q -y install nginx epel-release >/dev/null 2>&1
dnf -y -q install boxes cowsay >/dev/null 2>&1
echo "[ 완료 ] 패키지 설치"
# (ㄴ)서비스 설정
echo "[ 시작 ] 서비스 설정"
echo "
Welcome To My Server
Nginx
" | boxes -d info > /usr/share/nginx/html/index.html
echo "[ 완료 ] 서비스 설정"
# (ㄷ)서비스 기동
echo "[ 시작 ] 서비스 기동"
systemctl enable nginx >/dev/null 2>&1
systemctl start nginx >/dev/null 2>&1
echo "[ 완료 ] 서비스 기동"



