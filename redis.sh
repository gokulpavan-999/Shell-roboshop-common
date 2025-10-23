#!/bin/bash

source ./common.sh
app_name=redis

check_root

dnf module disable redis -y
VALIDATE $? "Disabling redis server"

dnf module enable redis:7 -y
VALIDATE $? "Enabling redis server"

dnf install redis -y
VALIDATE $? "Installing redis server"

sed -i -e 's/127.0.0.1/0.0.0.0/g' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf
VALIDATE $? "Allowing Remote connections to redis"

systemctl enable redis
VALIDATE $? "Enabling redis server"

systemctl start redis
VALIDATE $? "Starting redis server"
