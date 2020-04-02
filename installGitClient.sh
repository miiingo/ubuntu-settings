#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# Git Client 설치
echo "########################################################################################"
echo "################################## Install Git Client ##################################"

## 패키지 업데이트 및 업그레이드
echo "-> Update & Upgrade packages"
sudo apt update && sudo apt upgrade -y

# Git Client 설치
echo "-> Install Git Client"
sudo apt-get install git -y

echo

## Git Client 설치 확인
echo "-> Verify Git Client version"
git version

echo "########################################################################################"
echo
echo