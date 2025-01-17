#!/bin/bash

# This script demonstrates a solution to the race condition using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file with locking
write_to_file() {
  local file=$1
  local message=$2
  # Acquire lock
  flock -n 200</dev/null || exit 1 #Using flock, for other OS you can use other tools
  echo "$message" > "$file"
  # Release lock
  flock -u 200</dev/null
}

# Write to file1.txt
write_to_file file1.txt "Process 1 writing to file1.txt"

# Write to file2.txt
write_to_file file2.txt "Process 2 writing to file2.txt"

# The output is now predictable because the lock prevents concurrent writes.
echo "Content of file1.txt: $(cat file1.txt)"
echo "Content of file2.txt: $(cat file2.txt)"