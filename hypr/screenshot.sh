#!/bin/bash
#I'm not very good at Englih lol.
FORMAT="png"
NAME="Screenshot from $(date "+%d-%m-%y %H:%M:%S")"
PICTPATH="$HOME/Pictures/Screenshots/"
OUTPUT="$NAME.$FORMAT"

mkdir -p ${PICTPATH}

function list_geometry () {
	[ "$2" = with_description ] && local append="\t\(.title)" || local append=
    if [ "$1" = focused ]; then
        hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])'$append'"'
    else
        hyprctl -j clients | jq -r '.[] | select(.workspace.id | contains('$(hyprctl -j monitors | jq -r 'map(.activeWorkspace.id) | join(",")')')) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])'$append'"'
    fi
}

FOCUSED=`list_geometry focused`

case $1 in
  '-S' ) grim "${PICTPATH}${OUTPUT}" ;;
  ''| '-A' ) grim -g "$(slurp -d)" "${PICTPATH}${OUTPUT}" ;;
  '-W' ) grim -g "${FOCUSED}" "${PICTPATH}${OUTPUT}" ;;
esac
wl-copy -t image/"${FORMAT}" < "${PICTPATH}${OUTPUT}"
# notify-send "Screenshot" "File saved as <i>'$OUTPUT'</i> and copied to the clipboard." -i "${PICTPATH}${OUTPUT}"
