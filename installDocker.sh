#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# Docker 설치
echo "########################################################################################"
echo "#################################### Install Docker ####################################"

## 패키지 설치
echo "-> Install packages"
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

## Docker 공식 GPG 키 추가
echo "-> Add Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

## stable 저장소 설정
echo "-> Set up the stable repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

## 패키지 업데이트
echo "-> Update packages"
sudo apt-get update

## 최신 버전의 Docker CE 설치
echo "-> Install the latest version of Docker CE"
sudo apt-get -y install docker-ce

## Docker CE 설치 확인
echo "-> Verify that Docker CE is installed"
sudo docker run hello-world

# 사용자에게 Docker 명령어 처리 가능하게 권한 부여
echo "-> Add user into the docker group"
sudo usermod -a -G docker $(id -un)

## Docker 버전 확인
echo "-> Verify Docker CE version"
docker version

echo

# Docker Compose - 1.11.2 설치
echo "####################### Install Docker Compose (version: 1.11.2) #######################"

## Docker Compose 실행 파일 설치
echo "-> Install Docker Compose (version: 1.11.2)"
sudo curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

## Docker Compose 실행 권한 부여
echo "-> Apply executable permissions to the Docker Compose"
sudo chmod +x /usr/local/bin/docker-compose

## Docker Compose 버전 확인
echo "-> Verify Docker Compose version"
docker-compose --version

echo

echo "########################################################################################"
echo
echo