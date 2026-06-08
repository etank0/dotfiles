#!/usr/bin/env bash

config_file="/tmp/bar_cava_config"

cat > "$config_file" << EOF
[general]
bars = 10

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

pkill -f "cava -p $config_file"

chars="▁▂▃▄▅▆▇█"
dict="s/;//g"
for ((i = 0; i < ${#chars}; i++)); do
    dict+=";s/$i/${chars:$i:1}/g"
done

count=0
cava -p "$config_file" | while read -r line; do
    bars=$(echo "$line" | sed "$dict")

    count=$(( (count + 1) % 10 ))
    if [ "$count" -eq 0 ]; then
        status=$(playerctl status 2>/dev/null)
    fi

    if [ "$status" = "Playing" ]; then
        printf '{"text": "%s", "class": "playing"}\n' "$bars"
    elif [ "$status" = "Paused" ]; then
        printf '{"text": "%s", "class": "paused"}\n' "$bars"
    else
        echo '{"text": "", "class": "hidden"}'
    fi
done
