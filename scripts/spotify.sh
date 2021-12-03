#!/bin/bash

set -eu

country="US"
headers=(-H "Accept: application/json"), -H "Authorization: Bearer $TOKEN" )
user_id=$(curl -s -X get "https://api.spotify.com/v1/me" "${headers[@]}" | jq -r '.id')

get_top_tracks() {
    curl -s -X GET "https://api.spotify.com/v1/search" -G --data-urlencode "q=$1" --data-urlencode "type=track" --data-urlencode "limit=10" "${headers[@]}" | jq -r ".artists.items[0]?.id"
}

run() {
    get_top_tracks()
}