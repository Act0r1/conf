#!/bin/bash
# test merge
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Inside git repository"
fi
