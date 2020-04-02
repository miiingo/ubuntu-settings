#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# Java 설치 (JDK 버전: 8)
echo "########################################################################################"
echo "############################## Install Java(JDK version 8) #############################"

## 패키지 갱신 및 업그레이드
echo "-> Update & upgrade packages"
sudo apt update && sudo apt upgrade -y

## 패키지 설치
echo "-> Install packages"
sudo apt-get install -y openjdk-8-jdk maven

## Java 바이너리 파일 설치
echo "-> Install Java binary file"
wget https://services.gradle.org/distributions/gradle-2.12-bin.zip -P /tmp --quiet

## Java 바이너리 파일 압축 해제
echo "-> Unzip Java binary file"
sudo unzip -q /tmp/gradle-2.12-bin.zip -d /opt && rm /tmp/gradle-2.12-bin.zip

## Java 파일 링크 생성
echo "-> Create Java file link"
sudo ln -s /opt/gradle-2.12/bin/gradle /usr/bin

echo

## Java 설치 확인
echo "-> Verify Java version"
java -version

echo "########################################################################################"
echo
echo