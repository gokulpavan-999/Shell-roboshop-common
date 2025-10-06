#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[33m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/Shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
START_TIME=$(date +%s)

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

check_root(){
if [ $USERID -ne 0 ]; then
   echo -e "$R privilege:: Please run this script with root privilege $N"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo -e "$2 ... $R FAILURE $N" | tee -a $LOG_FILE
       exit 1
      else
       echo -e "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi    
  }
}

print_total_time(){
    END_TIME=$(date +%s)
    TOTAL_TIME=$(( $END_TIME - $START_TIME ))
    echo -e "Script executed in: $Y $TOTAL_TIME Seconds $N"
}
