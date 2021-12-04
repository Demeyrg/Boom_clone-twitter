#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/authorized-key \
    target/boom-1.0-SNAPSHOT.jar \
    slava@18.193.191.240:/home/dru/

echo 'Restart server...'

ssh -i ~/.ssh/authorized-key dru@18.193.191.240 << EOF
pgrep java | xargs kill -9
nohup java -jar sweater-1.0-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'