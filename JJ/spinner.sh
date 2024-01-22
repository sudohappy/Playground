#!/bin/bash
# Version 1.4
spinner() {
  local pid=$1
  local delay=0.1
  local spinstr='|/-\'
  
  while ps -p $pid > /dev/null; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}

# Example usage
echo "Running a task with a spinner..."

# Simulating a long-running command
sleep 3 &

# Capture the PID of the background process
pid=$!

# Call the spinner function with the PID
spinner $pid

# Check the exit status of the background process
if [ $? -eq 0 ]; then
  echo "Task completed successfully!"
else
  echo "Task failed or was interrupted."
fi

# Additional commands or actions after completion
echo "Performing cleanup or additional actions..."
