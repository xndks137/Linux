#!/bin/bash
set -e

# (ㄱ)패키지 설치
# - httpd, mod_ssl
# - epel-release
# - boxes, cowsay
# (ㄴ)서비스 설정
# - /var/www/html/index.html
# (ㄷ)서비스 기동
# systemctl restart httpd
# systemctl enable httpd

# (ㄱ)패키지 설치
echo "[ 시작 ] 패키지 설치"
dnf -q -y install httpd mod_ssl epel-release >/dev/null 2>&1
dnf -y -q install boxes cowsay >/dev/null 2>&1
echo "[ 완료 ] 패키지 설치"
# (ㄴ)서비스 설정
echo "[ 시작 ] 서비스 설정"
echo "
Welcome To My Server
Apache httpd
" | boxes -d info > /var/www/html/index.html
echo "[ 완료 ] 서비스 설정"
# (ㄷ)서비스 기동
echo "[ 시작 ] 서비스 기동"
systemctl enable httpd >/dev/null 2>&1
systemctl start httpd >/dev/null 2>&1
echo "[ 완료 ] 서비스 기동"



