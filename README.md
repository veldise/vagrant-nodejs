Node.js 개발 환경 공유
======================
* 아래 작업은 Windows 7 환경에서 수행되었습니다.

* Node.js 개발환경 구축은 다음과 같은 순서로 진행됩니다.
    1. VirtualBox, Vagrant 설치
    2. 폴더 생성 및 파일 다운로드(혹은 ```git clone```)
    3. ```vagrant up```
    4. Node.js 실행 및 확인

## VirtualBox 및 Vagrant 설치
* **Oracle VM VirtualBox 다운로드 및 설치**
    * https://www.virtualbox.org/

* **Vagrant 다운로드 및 설치**
    * http://downloads.vagrantup.com/

### 폴더 생성 및 <code>git clone</code>
* 작업공간 폴더를 생성합니다. (ex) workspace)
* 생성한 폴더에 소스코드를 압축파일로 다운 받거나 ```git clone``` 합니다.

## 가상머신 생성
* **command 창 실행**
    * 윈도키+R > cmd
* **Vagrant 관련 파일이 위치한 폴더로 이동**
    * > <code>cd workspace/vagrant-nodejs</code>
    * workspace 폴더가 있고, 그 밑에 파일을 다운 받았다고 가정.
* vagrant up 직전의 폴더 상태
```
    /workspace/
        └/vagrant-nodejs
            └/package
                └/1.library.sh
                └/2.pythonInstall.sh
                └/3.nodejsInstall.sh
                └/4.protocolBufferInstall.sh
                └/5.iptables.sh
            └Vagrantfile
```
* **Vagrant up 수행**
    * vagrant-nodejs 폴더로 이동합니다.
    * > ```cd envdev```
    * > ```vagrant up```
    * 정상적으로 수행되면 VirtualBox에 가상머신이 생성됩니다. 

### Windows 8 사용자의 경우
* 현재 Windows 8 사용자의 경우 provision 스크립트가 실행되지 않는 문제가 있습니다.
* 이 때에는 다음과 같이 나누어 실행하기 바랍니다.
  * > ```vagrant up --no-provision```
  * > ```vagrant provision```

## 서버 실행 및 확인
* vagrant up으로 생성한 가상머신(centos63-nodejs)에 로그인합니다.
    * ssh 로그인 정보
        * ID/PW: root/vagrant
        * ID/PW: vagrant/vagrant
* Python을 확인합니다.
```
    python -V
```
* Node.js를 확인합니다.
```
    node -v
```
* Protobuf를 확인합니다.
```
    protoc --version
```

## 가상머신 종료 및 재시작
* vagrant halt 로 가상머신을 종료할 수 있습니다.
    * > <code>vagrant halt</code>
* vagrant up 으로 가상머신을 다시 실행할 수 있습니다.
    * > <code>vagrant up</code>
    * '--no-provision' 옵션으로 실행하면 privisioning을 수행하지 않습니다.
    * > <code>vagrant up --no-privision</code>
