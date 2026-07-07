#!/bin/bash

set -e

i3lock \
    --ignore-empty-password \
    --image="$HOME/Pictures/Wallpapers/forest-waterfall-pixelart.png" \
    --fill \
    --clock \
    --radius=72 \
    --ring-width=16 \
    --inside-color=00000000 \
    --insidever-color=00000000 \
    --insidewrong-color=00000000 \
    --ring-color=04471C \
    --ringver-color=058C42 \
    --ringwrong-color=0D2818 \
    --separator-color=04471C \
    --keyhl-color=058C42 \
    --bshl-color=0D2818 \
    --line-uses-ring \
    --verif-text="" \
    --wrong-text="" \
    --noinput-text="" \
    --lock-text="" \
    --lockfailed-text="" \
    --greeter-text="" \
    --time-font=IBMPlexMono Bold \
    --date-font=IBMPlexMono Bold \
    --time-size=32 \
    --date-size=16 \
    --time-str="%H:%M" \
    --date-str="%d/%m/%Y" \
    --time-color=0D2818 \
    --date-color=04471C
