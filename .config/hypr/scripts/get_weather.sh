#!/bin/sh
# Read private URL from config
source ~/.config/hypr/private/weather.conf
# Fetch and format weather
curl -s "$WEATHER_URL" | tr -d '+'
