#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "script started executing at $TIMESTAMP" &>> $LOGFILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R FAILED $N"
    else
        echo -e "$2...$g SUCCESFULL $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR $N:: Be a root user"
    exit 1
else 
     echo -e "you are a $G ROOT $N user"
fi

for package in $@
do 
    yum list insatlled $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "insatlling $package"
    else
        echo -e "$package is already installed ...$Y SKIPPING $N"
    fi
done