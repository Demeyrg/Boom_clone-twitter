#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/authorized_keys \
    target/sweater-1.0-SNAPSHOT.jar \
    slava@46.137.15.86:/home/dru/

echo 'Restart server...'

ssh -i ~/.ssh/id_rsa_drucoder dru@46.137.15.86 << EOF
pgrep java | xargs kill -9
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'