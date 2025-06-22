#!/bin/bash

if [ $# -lt 2 ]; then
    echo "$0 <host> <port>"
    exit 1
fi

HOST=$1
PORT=$2
LOG_FILE="/var/log/ports.log"

nc -z -w 5 $HOST $PORT > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Порт $HOST:$PORT доступен"
else
    echo "Порт $HOST:$PORT недоступен, $LOG_FILE"
    echo "$(date): Порт $HOST:$PORT недоступен" >> $LOG_FILE
    exit 1
fi
