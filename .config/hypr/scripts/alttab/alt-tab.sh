#!/usr/bin/env bash
DIRECTION="${1:-down}"
INPUT_FILE="$2"
SEL_FILE="$3"
PREV_SUBMAP="${4:-reset}"

footclient -a alttab sh -c "
fzf \
  --color 'prompt:green,pointer:green,current-bg:-1,current-fg:green,gutter:-1,border:bright-black,current-hl:red,hl:red,preview-border:#4a4a4c' \
  --cycle --sync --wrap \
  --delimiter='\t' \
  --with-nth=2 \
  --bind 'double-click:ignore,start:$DIRECTION,tab:down,shift-tab:up' \
  --preview-window='down:40%,border-sharp' \
  --preview '$HOME/.config/hypr/scripts/alttab/preview.sh {}' \
  --layout=reverse \
  < '$INPUT_FILE' > '$SEL_FILE'
"

hyprctl -q eval 'hl.config({ animations = { enabled = true } })'
hyprctl -q dispatch "hl.dsp.submap(\"$PREV_SUBMAP\")"
ADDR=$(cut -f1 "$SEL_FILE" 2>/dev/null)
if [ -n "$ADDR" ]; then
  hyprctl -q dispatch "hl.dsp.focus({ window = 'address:$ADDR' })"
  hyprctl -q dispatch "hl.dsp.window.bring_to_top()"
fi
