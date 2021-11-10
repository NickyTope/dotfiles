#!/bin/bash

# https://imgur.com/gallery/[id]
# galleries=("rBarn" "TzfPU" "Gshpb" "T2kpv")
# galleries=("Y1OeM" "vdC7V" "OXhQa" "l8wwH" "ZpJXv" "8Yxub")

galleries=("nyJ4M" "rBarn" "VCnYv" "sf0O7" "foY2a" "zbTAe")
gallery=${galleries[$RANDOM % ${#galleries[@]}]}
IDS="$(curl "https://api.imgur.com/post/v1/posts/$gallery?client_id=883f0d26c1eb2b4&include=media" | jq '.media[].id' -r)"
# IDS="$(wget -q "https://imgur.com/a/YsWMXAQ" -O - | grep post-image-container | grep class | cut -d\" -f 2)"

readarray -t IDARRAY <<<"$IDS"
ID=${IDARRAY[$RANDOM % ${#IDARRAY[@]}]}
echo "fetching ${ID} from ${gallery}"
cd ~/Pictures/walls/new && wget -c -q -N "https://i.imgur.com/$ID.jpg"

