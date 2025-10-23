#!/bin/bash

source ./common.sh

check_root

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld
VALIDATE $? "Enabling MYSQL Server"

systemctl start mysqld
VALIDATE $? "Starting MYSQL Server"

mysql_secure_installation --set-root-pass RoboShop@1

print_total_time
