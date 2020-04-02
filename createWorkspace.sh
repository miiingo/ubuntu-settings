#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

# workspace 생성
echo "########################################################################################"
echo "################################### Create workspace ###################################"
cd /opt

## gopath/{src,pkg,bin} 디렉토리 생성
echo "-> create gopath/{src,pkg,bin} directory"
sudo mkdir -vp gopath/{src,pkg,bin}
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to create gopath/{src,pkg,bin} directory"
    exit 1
fi

## gopath 디렉토리 소유권 변경
echo "-> change owner to /opt/gopath directory"
sudo chown -R $(id -un):$(id -un) gopath
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to change owner to /opt/gopath directory"
    exit 1
fi
cd gopath/src

## github.com 디렉토리 생성
echo "-> create gopath/src/github.com directory"
mkdir github.com
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to create gopath/src/github.com directory"
    exit 1
fi
cd github.com

## github.com 디렉토리 생성
echo "-> create gopath/src/github.com/hyperledger directory"
mkdir hyperledger
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to create gopath/src/github.com/hyperledger directory"
    exit 1
fi
cd hyperledger

echo "########################################################################################"
echo 
