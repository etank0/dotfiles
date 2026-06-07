#!/bin/sh
# Read private URL from config
source ~/.config/hypr/private/weather.env
# Fetch and format weather
curl -s "$WEATHER_URL" | tr -d '+'
