#!/bin/sh

mode=$1

if [ "$mode" != "local" ]; then
    export $(cat secret.env | xargs)
fi


