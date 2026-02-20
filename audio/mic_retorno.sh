#!/bin/bash

set -e

if ! command -v pactl >/dev/null 2>&1; then
    echo "Error: 'pactl' is not installed or not in PATH." >&2
    exit 1
fi

case "$1" in
'on')
    if pactl list modules short | grep -q "module-loopback"; then
        echo "> Microphone loopback is already active."
    else
        pactl load-module module-loopback latency_msec=1
        echo "> Microphone loopback enabled."
    fi
    ;;
'off')
    if pactl list modules short | grep -q "module-loopback"; then
        pactl unload-module module-loopback
        echo "> Microphone loopback disabled."
    else
        echo "> Microphone loopback is not active."
    fi
    ;;
*)
    echo "Usage: $0 {on|off}"
    exit 1
    ;;
esac
