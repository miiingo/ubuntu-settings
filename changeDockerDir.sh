# Docker 실행 환경 설정
echo "########################### Setting the docker configuration ###########################"
## Docker 운영 디렉토리 생성
echo "-> create docker directory"
sudo mkdir -p /data/docker
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to create docker directory"
    exit 1
fi

## docker.service 설정 (운영 디렉토리 변경: /usr/bin/dockerd -> /data/docker)
echo "-> move docker.service"
sudo cp config/docker.service /lib/systemd/system/docker.service
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to copy docker.service"
    exit 1
fi

## docker.socket 설정
echo "-> move docker.socket"
sudo cp config/docker.socket /lib/systemd/system/docker.socket
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to copy docker.socket"
    exit 1
fi

## systemctl 설정
echo "-> enable systemctl docker"
sudo systemctl enable docker
if [ $? -ne 0 ]; then
    echo "ERROR !!!! Unable to set systemctl docker"
    exit 1
fi

echo 

# 시스템 재부팅
echo "######################################## Reboot ########################################"
echo 
sudo reboot
