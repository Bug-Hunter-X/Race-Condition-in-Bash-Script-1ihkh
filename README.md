# Race Condition in Bash Script

This repository demonstrates a race condition in a bash script.  The script uses two processes to concurrently write to files.  The outcome is unpredictable because the order of execution isn't guaranteed.

The `bug.sh` file contains the buggy code.  The `bugSolution.sh` file provides a solution using locking mechanisms to prevent the race condition.

This example highlights the importance of considering concurrency issues when writing shell scripts, especially when dealing with shared resources like files.