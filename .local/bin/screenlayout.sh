#!/bin/sh
intern=eDP1-1
extern=DP-2

if xrandr | grep $extern | grep "connected"; then
    xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --primary --mode 1680x1050 --pos 0x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off
else
    xrandr --output eDP-1 --on --mode 1920x1080 --pos 1680x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --off --output DP-2-2 --off --output DP-2-3 --off
fi

