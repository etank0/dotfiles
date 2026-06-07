#!/bin/sh

case "${1}" in
  --create)
    hyprctl output create headless
    hyprctl keyword monitor HEADLESS-2,1080x1920@60,-1080x0,1,transform,0
    hyprctl reload
    ;;
  --kill)
    hyprctl keyword monitor HEADLESS-2,disable
    hyprctl output remove HEADLESS-2
    hyprctl reload
    ;;
  *)
    echo "Usage: $0 [--create|--kill]"
    exit 1
    ;;
esac
