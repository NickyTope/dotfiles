#!/usr/bin/bash
# choose pulseaudio sink via rofi or dmenu
# changes default sink and moves all streams to that sink

set -eu -o pipefail

TYPE="${1:-sink}"
IO="${2:-input}"

list=$(
	ponymix -t "${TYPE}" list \
		| awk '/^'"${TYPE}"'/ {s=$1" "$2;getline;gsub(/^ +/,"",$0);print s" "$0}' \
		| grep -v 'Monitor of'
)

icon=
if [ "${TYPE}" == "sink" ]; then
	icon=
fi

target=$(
	echo "${list}" \
		| rofi -dmenu \
		| grep -Po '[0-9]+(?=:)'
)

ponymix -t "${TYPE}" set-default -d "${target}"

for input in $(ponymix list -t "${TYPE}-${IO}" | grep -Po '[0-9]+(?=:)'); do
	echo "$input -> ${target}"
	ponymix -t "${TYPE}-${IO}" -d "$input" move "${target}" || true
done
