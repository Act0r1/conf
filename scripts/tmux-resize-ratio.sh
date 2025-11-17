#!/bin/bash

# Check if ratio was provided as argument
ratio="$1"

# Get current pane info
current_pane=$(tmux display-message -p '#{pane_id}')
pane_top=$(tmux display-message -p '#{pane_top}')
pane_left=$(tmux display-message -p '#{pane_left}')
pane_width=$(tmux display-message -p '#{pane_width}')
pane_height=$(tmux display-message -p '#{pane_height}')

# Get all panes in current window
all_panes=$(tmux list-panes -F '#{pane_id} #{pane_top} #{pane_left} #{pane_width} #{pane_height}')

# Detect if we have a neighbor and determine orientation
orientation=""
neighbor_pane=""

while IFS= read -r line; do
    read -r pid ptop pleft pwidth pheight <<< "$line"

    if [ "$pid" = "$current_pane" ]; then
        continue
    fi

    # Check for vertical split (neighbor has same top, different left)
    if [ "$ptop" = "$pane_top" ] && [ "$pleft" != "$pane_left" ]; then
        orientation="vertical"
        neighbor_pane="$pid"
        break
    fi

    # Check for horizontal split (neighbor has same left, different top)
    if [ "$pleft" = "$pane_left" ] && [ "$ptop" != "$pane_top" ]; then
        orientation="horizontal"
        neighbor_pane="$pid"
        break
    fi
done <<< "$all_panes"

if [ -z "$orientation" ]; then
    tmux display-message "No adjacent pane found!"
    exit 1
fi

# If no ratio provided, show popup to get input
if [ -z "$ratio" ]; then
    tmux display-popup -E -w 60 -h 10 "bash -c '
        echo \"Current layout: $orientation split\"
        echo \"\"
        echo \"Enter ratio (e.g., 70/30, 60/40, 50/50):\"
        read -r ratio
        ~/.local/bin/tmux-resize-ratio.sh \"\$ratio\"
    '"
    exit 0
fi

# Parse ratio
if [[ ! "$ratio" =~ ^([0-9]+)/([0-9]+)$ ]]; then
    tmux display-message "Invalid format! Use format like 70/30"
    exit 1
fi

left_percent="${BASH_REMATCH[1]}"
right_percent="${BASH_REMATCH[2]}"

# Validate ratio adds to 100
total=$((left_percent + right_percent))
if [ "$total" -ne 100 ]; then
    tmux display-message "Warning: Ratio doesn't add to 100 ($total). Normalizing..."
    left_percent=$((left_percent * 100 / total))
fi

# Calculate target size based on orientation
if [ "$orientation" = "vertical" ]; then
    # Get total width of both panes
    total_width=$(tmux display-message -p '#{window_width}')
    target_width=$((total_width * left_percent / 100))

    # Determine which pane is on the left
    current_left="$pane_left"
    neighbor_left=$(tmux display-message -p -t "$neighbor_pane" '#{pane_left}')

    if [ "$current_left" -lt "$neighbor_left" ]; then
        # Current pane is on the left
        tmux resize-pane -t "$current_pane" -x "$target_width"
    else
        # Current pane is on the right, resize neighbor instead
        target_width=$((total_width * right_percent / 100))
        tmux resize-pane -t "$neighbor_pane" -x "$target_width"
    fi
else
    # Horizontal split
    total_height=$(tmux display-message -p '#{window_height}')
    target_height=$((total_height * left_percent / 100))

    # Determine which pane is on top
    current_top="$pane_top"
    neighbor_top=$(tmux display-message -p -t "$neighbor_pane" '#{pane_top}')

    if [ "$current_top" -lt "$neighbor_top" ]; then
        # Current pane is on top
        tmux resize-pane -t "$current_pane" -y "$target_height"
    else
        # Current pane is on bottom, resize neighbor instead
        target_height=$((total_height * right_percent / 100))
        tmux resize-pane -t "$neighbor_pane" -y "$target_height"
    fi
fi

tmux display-message "Resized to $left_percent/$right_percent ratio!"
