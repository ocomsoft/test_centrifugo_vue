#!/bin/bash
mkdir install
cd install
#wget https://github.com/centrifugal/centrifugo/releases/download/v2.6.0/centrifugo_2.6.0_linux_amd64.tar.gz
tar xvzf centrifugo_2.6.0_linux_amd64.tar.gz
mv centrifugo ../centrifugo
cd ..
chmod +x centrifugo
./centrifugo  version
./centrifugo  genconfig
echo "add 'publish': true to the config.json "

