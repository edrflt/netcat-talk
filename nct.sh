#!/bin/bash

ord()
{
    LC_CTYPE=C printf '%d' "'$1"
}

hlp()
{
    echo -e "\033[31mUsage :\033[0m"
    echo -e "\033[32mnct -s username \033[0m     : sends stdin to username (get username with w)"
    echo -e "\033[32mnct -r [file name] \033[0m  : shows messages received, if file name is specified, writes to file name and quits"
}

prt()
{
    port=0
    nom=$1
    for (( i=0; i<${#nom}; i++ ))
    do
        c=$(ord ${nom:$i:1})
        port=$(($port + $c))
    done
    port=$(($port + 20000))
    echo $port
}

if [ $# -eq 0 ]
then
    hlp
    exit 1
else
    if [ $1 = "-s" ]
    then
        nom=$2
        port=$(prt $nom)
        donnees=$(cat)

        echo "$donnees" | nc 127.0.0.1 $port
    elif [ $1 = "-r" ]
    then
        nom=$(whoami)
        port=$(prt $nom)

        if [ $# = 2 ]
        then
            nc -l $port > $2
        else
            while [ 1 -eq 1 ]
            do
                nc -l $port
                echo -e "\033[31m===== END =====\033[0m"
            done
        fi
    fi
fi
