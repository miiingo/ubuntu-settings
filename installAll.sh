#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# workspace 생성
./createWorkspace.sh
sleep 3

# 기본 유틸 설치
./installBasicUtils.sh
sleep 3

# Git Client 설치
# ./installGitClient.sh
# sleep 3

# Go 언어 설치 및 실행 테스트(버전 1.10)
./installGo.sh
sleep 3

# Node.JS 설치(버전 선택: 8.x / 6.x)
./installNodeJS.sh
sleep 3

# Java 설치(JDK 버전 8)
# ./installJava.sh
# sleep 3

# Docker & Docker Compose(버전 1.11.2) 설치
./installDocker.sh
sleep 3

# 시스템 재시작
reboot