# Ubuntu Settings

Ubuntu 기본 환경을 설치하는 스크립트 파일들입니다.

1. createWorkspace.sh : workspace 생성
2. installBasicUtils.sh : 기본 유틸 설치(build-essential, make, curl, unzip, g++, libtool)
3. installGitClient.sh : Git Client 설치
4. installGo.sh : Go 언어 설치 및 실행 테스트(버전 1.10)
5. installNodeJS.sh : Node.JS 설치(버전 선택: 8.x / 6.x)
6. installJava.sh : Java 설치(JDK 버전 8)
7. installDocker.sh : Docker & Docker Compose(버전 1.11.2) 설치
8. installAll.sh : 모든 도구들을 한 번에 설치
9. changeDockerDir.sh : Docker의 운영 디렉토리 변경 (필요한 경우에만 직접 실행 필요)

※ changeDockerDir.sh 스크립트는 Docker가 이미지나 컨테이너 등을 유지하기 위해 사용하는 Docker의 운영 디렉토리를 변경하는 것으로, 기존의 /var/lib/docker/ 디렉토리에서 별도의 스토리지로 설정된 /data/docker 디렉토리로 변경합니다. 저장 공간 등의 이유로 Docker 운영 디렉토리를 변경해야 하는 경우에만 별도로 직접 실행해주면 됩니다. 스크립트 실행 시 서버가 재시작됩니다.


## Ubuntu Settings 기본 설정

Ubuntu Settings 프로젝트를 다운받기 위해, Git Client를 수동으로 설치하고 프로젝트를 다운로드합니다.

설치 경로는 홈 디렉토리로 설정합니다.

```linux-config
# Git Client 설치
sudo apt update && sudo apt upgrade -y
sudo apt-get install git -y

# Ubuntu Settings 프로젝트 다운로드
cd ~
git clone http://220.230.113.60:9010/honeybee/ubuntu-settings.git

```


## 설치(Install)


### 한 번에 모든 도구 설치

모든 도구들을 한 번에 설치
```linux-config
cd ubuntu-settings
./installAll.sh

```

### 개별적으로 도구 설치

```linux-config
# workspace 생성
./createWorkspace.sh

# 기본 유틸 설치
./installBasicUtils.sh

# Git Client 설치
./installGitClient.sh

# Go 언어 설치 및 실행 테스트(버전 1.10)
./installGo.sh

# Node.JS 설치(버전 선택: 8.x / 6.x)
./installNodeJS.sh

# Java 설치(JDK 버전 8)
./installJava.sh

# Docker & Docker Compose(버전 1.11.2) 설치
./installDocker.sh

# Docker 운영 디렉토리 변경 (필요한 경우에만 직접 실행 필요)
./changeDockerDir.sh

```


## 설치 시 오류 해결


### Error 1: hyper 계정에 sudo 권한 부여

hyper 계정에 sudo 권한이 없어 설치 스크립트 실행에 오류가 발생할 경우, 다음 과정을 통해 권한을 부여해주어야 합니다.

```linux-config
# root 계정 비밀번호 설정
sudo passwd root

# root 권한으로 접속
su

# 그룹 권한 확인
groups

# sudo 그룹에 현재 계정 추가
usermod -a -G sudo $(id -un)

# 그룹 권한 재확인
groups

# 변경 권한 적용을 위한 시스템 재부팅
reboot

```


### Error 2: dpkg was interrupted 

E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem.

`apt-get install` 명령 수행 시 위와 같은 오류가 발생할 경우 다음 명령을 수행합니다.

```linux-config
sudo dpkg --configure -a

```


### Error 3: Permission denied

-bash: ./installAll.sh: Permission denied

설치 스크립트 실행 시 위와 같은 오류가 발생할 경우 다음 명령을 통해 실행 권한을 부여합니다.

```linux-config
# chmod 775 <해당 쉘 스크립트 파일명>
chmod 775 installAll.sh

```