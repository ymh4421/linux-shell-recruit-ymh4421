#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>


if [ $# -eq 0 ]; then
    echo "Usage: ./scripts/analyze.sh FILE"
    exit 1
fi


if [ ! -f "$1" ]; then
    echo "Error: file not found: $1"
    exit 1
fi


count=$(grep -c "ERROR" "$1")


top_code=$(grep "ERROR" "$1" | sed 's/.*code=\([0-9]*\).*/\1/' | sort | uniq -c | sort -rn | head -1 | awk '{print $2}')


echo "Total ERROR: $count"
echo "Top Code: $top_code"

exit 0

