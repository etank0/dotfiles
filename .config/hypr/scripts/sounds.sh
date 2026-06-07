#!/usr/bin/env bash
## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Play system sounds.

theme="freedesktop"
mute=false
muteScreenshots=false
muteVolume=false

if [[ "$mute" = true ]]; then
  exit 0
fi

if [[ "$1" == "--screenshot" ]]; then
  if [[ "$muteScreenshots" = true ]]; then
    exit 0
  fi
  soundoption="screen-capture.*"
elif [[ "$1" == "--volume" ]]; then
  if [[ "$muteVolume" = true ]]; then
    exit 0
  fi
  soundoption="audio-volume-change.*"
else
  echo -e "Available sounds: --screenshot, --volume"
  exit 0
fi

userDIR="$HOME/.local/share/sounds"
systemDIR="/usr/share/sounds"
defaultTheme="freedesktop"

sDIR="$systemDIR/$defaultTheme"
if [ -d "$userDIR/$theme" ]; then
  sDIR="$userDIR/$theme"
elif [ -d "$systemDIR/$theme" ]; then
  sDIR="$systemDIR/$theme"
fi

iTheme=$(grep -i "inherits" \
  "$sDIR/index.theme" | cut -d "=" -f 2)
iDIR="$sDIR/../$iTheme"

sound_file=$(find "$sDIR/stereo" \
  -name "$soundoption" -print -quit)
if ! test -f "$sound_file"; then
  sound_file=$(find "$iDIR/stereo" \
    -name "$soundoption" -print -quit)
  if ! test -f "$sound_file"; then
    sound_file=$(find "$userDIR/$defaultTheme/stereo" \
      -name "$soundoption" -print -quit)
    if ! test -f "$sound_file"; then
      sound_file=$(find "$systemDIR/$defaultTheme/stereo" \
        -name "$soundoption" -print -quit)
      if ! test -f "$sound_file"; then
        echo "Error: Sound file not found."
        exit 1
      fi
    fi
  fi
fi
pw-play "$sound_file"
