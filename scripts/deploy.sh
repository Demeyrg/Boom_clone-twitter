#!/usr/bin/env bash

mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/boom-key.pem \
    target/boom-1.0-SNAPSHOT.jar \
    ec2-user@ec2-3-120-145-249.eu-central-1.compute.amazonaws.com:/home/slava/

echo 'Restart server...'

ssh -i ~/.ssh/boom-key.pem ec2-user@ec2-3-120-145-249.eu-central-1.compute.amazonaws.com << EOF
pgrep java | xargs kill -9
nohup java -jar boom-1.0-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'