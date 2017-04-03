#!/bin/bash

ord()
{
    LC_CTYPE=C printf '%d' "'$1"
}

hlp()
{
    echo "Usage :"
    echo "nct -s username : sends stdin to username (get username with w)"
    echo "nct -r [file name] shows messages received, if file name is specified, writes to file name and quits"
}

prt()
{
    port=0
    nom=$1
    for (( i=0; i<${$#nom}; i++ ))
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
            nc -lk $port
        fi
    fi
fi
