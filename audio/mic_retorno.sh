#!/bin/bash

set -e

OPTION="$1"

case "$OPTION" in
'on')
    pactl load-module module-loopback latency_msec=0
    ;;
'off')
    pactl unload-module module-loopback
    ;;
*)
    echo "> Los argumentos validos son on y off"
    ;;
esac
