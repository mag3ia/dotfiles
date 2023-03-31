#!/bin/sh
# Check if a file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Display the file size
du -sh "$1"
