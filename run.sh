#!/bin/bash
yarn install

cd centrifugo
./centrifugo --admin &

yarn serve &

echo "Open the browser above"


