#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar main 2>&1 | tee -a /tmp/polybar1.log & disown


my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar secondary &
fi
