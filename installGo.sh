#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# Go 언어 설치
echo "########################################################################################"
echo "############################# Install Go lang(version 1.10) ############################"

## go 언어 설치 파일 다운로드 경로: /opt
echo "-> Go to the Go lang install directory: /opt"
cd /opt

## go 언어 바이너리 파일 다운로드
echo "-> Install Go binary file"
sudo wget https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz

## go 언어 압축 해제
echo "-> tar Go binary file"
sudo tar -C /opt -xzf go1.10.linux-amd64.tar.gz

## go 언어 바이너리 파일 제거
echo "-> remove Go binary file"
sudo rm -rf go1.10.linux-amd64.tar.gz

## go 언어 패키지 설치
echo "-> Install golang-go package"
sudo apt install -y golang-go


# go workspace 디렉토리 생성
echo
echo "############################# Create go workspace directory #############################"

## go 언어 설치 파일 다운로드 경로: /opt
echo "-> Go to the Go lang install directory: /opt"
cd /opt

## workspace 생성
echo "-> Create workspace directory"
sudo mkdir -vp gopath/{src,pkg,bin}

## workspace 소유권 변경
echo "-> Change workspace directory's ownership"
sudo chown -R $(id -un):$(id -un) gopath

## 기본 디렉터리 생성
echo "-> Create basic directory"
cd gopath/src
mkdir github.com
cd github.com
mkdir hyperledger
cd hyperledger

# GOPATH 설정
echo
echo "#################################### Setting GOPATH #####################################"

## /etc/profile 파일 권한 변경
echo "-> Change the permission to /etc/profile"
sudo chmod 664 /etc/profile

## /etc/profile 파일에 GOPATH 추가
echo "-> Add GOPATH to /etc/profile"
sudo echo '
export GOPATH="/opt/gopath"
export GOROOT="/opt/go"
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH' >> /etc/profile

## /etc/profile 파일 설정 적용
echo "-> Apply the /etc/profile setting"
source /etc/profile

# Go언어 설치 완료 테스트
echo
echo "####################### Check the Go lang is installed correctly ########################"

## gopath에 hello 디렉터리 생성
echo "-> Create \'hello\' directory into the GOPATH/src"
cd /opt/gopath/src && mkdir hello

## hello 디렉터리로 이동
echo "-> GO to the \'hello\' directory"
cd hello

## hello.go 파일 작성
echo "-> Create and write \'hello.go\' file"
echo 'package main

import "fmt"

func main() {
    fmt.Printf("hello, world\n")
}' > $(pwd)/hello.go

## hello.go 파일 빌드
echo "-> Build \'hello.go\' file"
go build

## hello.go 파일 실행
echo "-> Run \'hello.go\' file"
./hello

echo

## Go 설치 확인
echo "-> Verify Go version"
go version

echo "########################################################################################"
echo
echo