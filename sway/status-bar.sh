#!/bin/bash

green1="#020202"
green2="#0D2818"
green3="#04471C"
green4="#058C42"
green5="#16DB65"
white="#FFFFFF"
blank="#00000000"

json_prefix() {
    printf '{ "version": 1 }\n\n[\n'
}

date_info() {
    local full_text=$(date '+%d/%m')

    printf '{"full_text":"%s","color":"%s"},\n' "$full_text" "$green4"
}

time_info() {
    local full_text=$(date '+%H:%M:%S')

    printf '{"full_text":"%s","color":"%s", "background":"%s"},\n' " $full_text " "$green5" "$green3"
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
    local background=$blank
    
    if [[ $status == "C" ]]; then # charging
        full_text="$status: $percentage $btime"
        color=$green4
    fi
    if [[ $status == "D" ]]; then # discharging
        full_text="$status: $percentage $btime"
        color=$green5
    fi
    if [[ $status == "N" ]]; then # not charging
        full_text="$status: $percentage"
        color=$green3
    fi

    local percent=${percentage%\%}
    if [[ $percent =~ ^[0-9]+$ ]] && (( percent < 20 )); then
        local seconds=$((10#$(date '+%S')))
        if (( seconds % 2 == 0 )); then
            background=$green5
            color=$green2
        fi
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"},\n' "$full_text" "$color" "$background"
}

brightness_info() {
    local brightness=$(brightnessctl -m | awk -F"," '{print $4}')
    local full_text="S: $brightness"

    printf '{"full_text":"%s","color":"%s"},\n' "$full_text" "$green4"
}

volume_info() {
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n1)
    local mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk -F": " '{print $2}')

    local full_text=""
    local color=$green4
    local background=$blank

    if [[ $mute == "yes" ]]; then
        full_text="M: $volume"
        color=$green3
    else
        full_text="A: $volume"
        color=$green4
        local percent=${volume%\%}
        if (( percent > 100 )); then
            background=$green2
        fi
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"},\n' "$full_text" "$color" "$background"
}

mic_info() {
    local mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk -F": " '{print $2}')

    local full_text=""
    local color=$green4
    local background=$blank

    if [[ $mute == "yes" ]]; then
        full_text="OFF"
        color=$green3
    else
        full_text=" ON "
        color=$green5
        background=$green2
    fi

    printf '{"full_text":"%s","color":"%s","background":"%s"},\n' "$full_text" "$color" "$background"
}

####################################################################################################

json_prefix
while true; do
    printf '[\n'
    volume_info
    mic_info
    battery_info
    brightness_info
    date_info
    time_info
    printf '],\n'
    
    sleep 1
done
