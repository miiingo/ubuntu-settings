#! /bin/bash
# 이 프로그램은 bash를 기반으로 실행됩니다.

function selectVersion () {
    echo "select the version of NodeJS to install."
    select var in "version 8.x" "version 6.x" "Exit"
    do
        if [ "$var" = "version 8.x" ]
        then
            echo "############################## Install NodeJS(version 8.x) ##############################"
            curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
            break
        elif [ "$var" = "version 6.x" ]
        then
            echo "############################## Install NodeJS(version 6.x) ##############################"
            curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
            break
        elif [ "$var" = "Exit" ]
        then
            exit 1
        else
            echo "invalid response..."
            selectVersion
        fi
    done
}

# NodeJS 설치
echo "########################################################################################"
echo "#################################### Install NodeJS ####################################"

## NodeJS 설치 버전 선택
echo "-> Select NodeJS install version"
selectVersion

## 패키지 설치
echo "-> Install packages"
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

## global 설치를 위한 설정
echo "-> Set path to install global modules"
mkdir ~/npm-global-modules && npm config set prefix '~/npm-global-modules' && echo "export PATH=~/npm-global-modules/bin:\$PATH" >> ~/.profile && source ~/.profile

echo

## NodeJS 설치 확인
echo "-> Verify NodeJS version"
node -v

echo "########################################################################################"
echo
echo