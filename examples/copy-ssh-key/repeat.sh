#!/bin/bash

USER=$1
PASS=$2

SERVERS=$(cat servers.txt)

for SERV in $SERVERS; do
        
./copy-ssh-key.sh $USER $PASS $SERV 

done
