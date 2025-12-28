#!/usr/bin/env bash

# 1. Load your fzf variables (adjust path if necessary)
[ -f "$HOME/.fzf.zsh" ] && . "$HOME/.fzf.zsh"

hyprctl -q dispatch submap alttab
start=$1

# 2. Run fzf - it will now merge your FZF_DEFAULT_OPTS with these flags
address=$(hyprctl -j clients | jq -r 'sort_by(.focusHistoryID) | .[] | select(.workspace.id >= 0) | "\(.address)\t\(.title)"' |
          fzf --cycle \
          --sync \
          --bind "tab:down,shift-tab:up,start:$start,double-click:ignore" \
          --wrap \
          --delimiter=$'\t' \
          --with-nth=2 \
          --preview "$HOME/.config/hypr/scripts/alttab/preview.sh {}" \
          --preview-window=down:60% \
          --layout=reverse |
          awk -F"\t" '{print $1}')

if [ -n "$address" ] ; then
    echo "$address" > "$XDG_RUNTIME_DIR/hypr/alttab/address"
fi

hyprctl -q dispatch submap reset
