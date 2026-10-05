#!/bin/bash

bg_1="#303030"
bg_2="#202020"
bg_3="#000000"

fg_1="#909090"
fg_2="#B0B0B0"
fg_3="#F0F0F0"

red="#F03020"
green="#10F060"
yellow="#E0F000"
blue="#2080F0"
purple="#F020E0"
aqua="#20F0F0"
orange="#F08020"
gray="#707070"

red_2="#C00000"
green_2="#00B000"
yellow_2="#D0A000"
blue_2="#1010D0"
purple_2="#A00080"
aqua_2="#20B0B0"
orange_2="#C05010"
gray_2="#404040"


json_prefix() {
    printf '{ "version": 1 }\n[\n'
}

date_info() {
    local full_text=$(date '+%d/%m')
    local color=$fg_2
    local background=$bg_3

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

time_info() {
    local full_text=$(date '+%H:%M:%S')
    local color=$bg_2
    local background=$fg_2

    full_text=" $full_text " # add extra padding

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

battery_info() {
    local acpi_out=acpi

    local status=$("$acpi_out" | awk -F" " '{print $3}' | cut -c1)
    local percentage=$("$acpi_out" | awk -F", " '{print $2}')
    local btime=$("$acpi_out" | awk -F" " '{print $5}')
    if [[ $btime == "discharging" ]]; then
        btime="??:??"
    else
        btime="${btime%:*}"
    fi

    local full_text=""
    local color=""
    local background=$bg_3

    if [[ $status == "C" ]]; then # charging
        if [[ $percentage == "100%" ]]; then # fully charged but still charging
            full_text="$status: $percentage"
        else
            full_text="$status: $percentage $btime"
        fi
        color=$aqua_2
    fi
    if [[ $status == "D" ]]; then # discharging
        full_text="$status: $percentage $btime"
        color=$yellow_2
    fi
    if [[ $status == "N" ]]; then # not charging
        full_text="$status: $percentage"
        color=$fg_1
    fi

    local percent=${percentage%\%}
    if [[ $percent =~ ^[0-9]+$ ]] && (( percent <= 30 )); then
        local seconds=$((10#$(date '+%S')))
        if (( seconds % 2 == 0 )); then
            background=$red_2
            color=$bg_3
        else
            background=$bg_3
            color=$red_2
        fi
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

brightness_info() {
    local brightness=$(brightnessctl -m | awk -F"," '{print $4}')
    local full_text="S: $brightness"
    local color=$blue
    local background=$bg_3

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

volume_info() {
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n1)
    local mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk -F": " '{print $2}')

    local full_text=""
    local color=$purple
    local background=$bg_3

    if [[ $mute == "yes" ]]; then
        full_text="M: $volume"
        color=$purple_2
    else
        full_text="A: $volume"
        color=$purple
        local percent=${volume%\%}
        if (( percent > 100 )); then
            color=$bg_2
            background=$red
        fi
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

mic_info() {
    local mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk -F": " '{print $2}')

    local full_text=""
    local color=$red
    local background=$bg_3

    if [[ $mute == "yes" ]]; then
        full_text="OFF"
        color=$fg_1
    else
        full_text=" ON "
        color=$bg_2
        background=$red
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

cpu() {
    local percentage=$(top -bn1 | grep '%Cpu' | tail -1 | grep -P '(....|...) id' | awk '{ print 100-$8 }')

    local full_text="CPU: $percentage%"
    local color=$green_2
    local background=$bg_3

    if (( $(echo "$percentage > 80 " | bc -l) )); then
        color=$red_2
    elif (( $(echo "$percentage > 60 " | bc -l) )); then
        color=$orange_2
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

mem() {
    local total=$(free | grep "Mem" | awk '{ print $2 }')
    local used=$(free | grep "Mem" | awk '{ print $3 }')

    local percentage=$(echo "scale=1; $used*100/$total" | bc)

    local full_text="MEM: $percentage%"
    local color=$green_2
    local background=$bg_3

    if (( $(echo "$percentage > 80 " | bc -l) )); then
        color=$red_2
    elif (( $(echo "$percentage > 60 " | bc -l) )); then
        color=$orange_2
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"}' "$full_text" "$color" "$background"
}

####################################################################################################

json_prefix
while true; do
    printf '[\n'
    volume_info
    printf ','
    mic_info
    printf ','
    battery_info
    printf ','
    mem
    printf ','
    cpu
    printf ','
    brightness_info
    printf ','
    date_info
    printf ','
    time_info
    printf '\n],\n'
    sleep 1
done
