#!/bin/sh

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)
stylus=$(echo "${list}" | xsetwacom list devices | awk -F'\t' '/stylus/{print $2}' | awk '/.*/{print $2}')

 xsetwacom set "${stylus}" MapToOutput "HEAD-1"
