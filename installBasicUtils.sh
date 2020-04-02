#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# 기본 유틸 설치
echo "########################################################################################"
echo "################################## Install Basic Utils #################################"

## 소프트웨어 업데이트 및 업그레이드
echo "-> software update & upgrade"
sudo apt update && sudo apt upgrade -y

## 패키지 설치
echo "-> install packages"
sudo apt-get install -y build-essential make curl unzip g++ libtool

echo "########################################################################################"
echo
echo