#!/usr/bin/env bash
while true; do
    if ! mpc idle player; then
        sleep 5
        continue
    fi
    /home/dez/.bin/songinfo
done
