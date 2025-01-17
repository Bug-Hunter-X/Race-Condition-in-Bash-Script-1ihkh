#!/bin/bash

# This script demonstrates a race condition.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously
(echo "Process 1 writing to file1.txt" > file1.txt &)
(echo "Process 2 writing to file2.txt" > file2.txt &)

# Wait for both processes to finish
wait

# The race condition happens here. The output is unpredictable 
because the order in which the processes write to the files is not guaranteed.
echo "Content of file1.txt: $(cat file1.txt)"
echo "Content of file2.txt: $(cat file2.txt)"