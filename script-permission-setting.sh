#!/bin/bash

# Set the target directory as a variable
TARGET_DIR="/mnt/temp"

# Check if a directory argument was passed, and use it if provided
if [ -n "$1" ]; then
  TARGET_DIR="$1"
fi

# Directory creation
mkdir -p "$TARGET_DIR"

# Configure permissions
chmod g+s "$TARGET_DIR"
setfacl -d -m u::rw-,g::r--,o::r-- "$TARGET_DIR"
setfacl -d -m u::rwx,g::r-x,o::r-x "$TARGET_DIR"

# Validate permissions
getfacl "$TARGET_DIR"

# Test: Create sample files and directories
for x in 1 2 3 4 5; do
  echo "this is sparta $x" > "$TARGET_DIR/file$x"
done

for x in 1 2 3 4 5; do
  mkdir -p "$TARGET_DIR/subdir$x"
done

for x in 1 2 3 4 5; do
  echo "this is sparta $x" > "$TARGET_DIR/subdir$x/file$x"
done
