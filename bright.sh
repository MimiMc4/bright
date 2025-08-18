#!/bin/bash

# Easy screen brightness control

# Configure your device name
# Run "brightnessctl -l" to get list of devices
DEVICE_NAME=""  #your device name here

max=$( brightnessctl -d "$DEVICE_NAME" m ) || {
    echo "The device $DEVICE_NAME doesn't exist or brightnessctl is not installed." >&2
    exit 1
}
current=$( brightnessctl -d "$DEVICE_NAME" g ) || exit 1
step=$(( max / 10 ))

case "$1" in
    "++")
        new=$((current + step < max ? current + step : max))
        brightnessctl -d "$DEVICE_NAME" s "$new" 
        ;;
    "--")
        new=$((current - step > 0 ? current - step : 0))
        brightnessctl -d "$DEVICE_NAME" s "$new"
        ;;
    *)
        if [[ $1 =~ ^[0-9]+$ && $1 -ge 0 && $1 -le 100 ]]; then
            level=$(( $1 * max / 100 ))
            brightnessctl -d "$DEVICE_NAME" s "$level" 
        else
            echo "Usage: brightness [ ++ | -- | 0-100 ]" >&2
            exit 1
        fi
        ;;
esac

