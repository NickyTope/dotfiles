#!/bin/bash

subreddits=("ExposurePorn" "EarthPorn" "wallpapers" "WQHD_Wallpaper" "wallpaperdump" )

subreddit=${subreddits[$RANDOM % ${#subreddits[@]}]}
IDS="$(wget -q "https://imgur.com/r/$subreddit" -O - | grep '"post"' | grep class | cut -d\" -f 2)" 
readarray -t IDARRAY <<<"$IDS"
ID=${IDARRAY[$RANDOM % ${#IDARRAY[@]}]}
echo "fetching ${ID} from ${subreddit}"
cd ~/Pictures/walls/new && wget -c -q -N "https://i.imgur.com/$ID.jpg"

