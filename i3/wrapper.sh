#!/bin/sh

update_holder() {
  local instance="$1"
  local replacement="$2"
  echo "$json_array" | jq --argjson arg_j "$replacement" "(.[] | select(.instance==\"$instance\")) |= \$arg_j"
}

remove_holder() {
  local instance="$1"
  echo "$json_array" | jq "del(.[] | select(.instance==\"$instance\"))"
}

brightness_block() {
  local value
  value=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%\))')

  local json
  json=$(jq -n --arg text "S: ${value}%" '{full_text: $text}')

  json_array=$(update_holder holder__brightness "$json")
}

i3status | (
  read line && echo "$line"
  read line && echo "$line"
  read line && echo "$line"

  while true; do
    read line
    json_array="$(echo $line | sed -e 's/^,//')"
    brightness_block
    echo ",$json_array"
  done
)
