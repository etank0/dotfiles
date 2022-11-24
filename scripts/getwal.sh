#!/bin/sh
query=$(printf '%s' "$*" | tr " " "+" )
page=1

while [ $page -lt 3 ]
do 
	curl -s "https://wallhaven.cc/api/v1/search?q=$query&page=$page&sorting=favorites" | jq '.data[].path' | xargs -I{} wget {}
	page=$(( $page+1 ))
done
