#!/bin/bash

# https://imgur.com/gallery/[id]
# "0oiM1" "SPmIR" "lkhbk88" 
galleries=("rBarn" "TzfPU" "Gshpb" "T2kpv")
gallery=${galleries[$RANDOM % ${#galleries[@]}]}
echo $gallery
IDS="$(curl "https://api.imgur.com/post/v1/posts/$gallery?client_id=883f0d26c1eb2b4&include=media,tags,account,adconfig,promoted" | jq '.media[].id' -r)"


# IDS="$(wget -q "https://imgur.com/a/YsWMXAQ" -O - | grep post-image-container | grep class | cut -d\" -f 2)"

readarray -t IDARRAY <<<"$IDS"
ID=${IDARRAY[$RANDOM % ${#IDARRAY[@]}]}
echo "fetching ${ID} from ${subreddit}"
cd ~/Pictures/walls/new && wget -c -q -N "https://i.imgur.com/$ID.jpg"

