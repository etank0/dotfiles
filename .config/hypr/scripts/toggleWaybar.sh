#!/usr/bin/env bash

if pidof waybar >/dev/null; then
    pkill waybar
else
    waybar > /dev/null 2>&1 &
fi

exit 0
