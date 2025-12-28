#!/bin/sh

hyprctl output create headless
hyprctl keyword monitor HEADLESS-2,1080x1920@60,-1080x0,1,transform,0
# hyprctl keyword monitor HEADLESS-2,disable
# hyprctl output remove HEADLESS-2
hyprctl reload
