#!/bin/zsh

# Prompt for user input
print -n "Enter your username: "
read  user
echo
print -n "Enter your password: "
#stty -echo
read -rs pass
#stty echo
echo 
print -n "Enter your enable password: "
#stty -echo
read -rs enable_pass
#stty echo
echo

# Set the environment variables for the current shell
export PYATS_USER="$user"
export PYATS_PASS="$pass"
export PYATS_ENABLE_PASS="$enable_pass"

# Print a message
echo "Environment variables set:"
echo "PYATS_USER: $PYATS_USER"
echo "PYATS_PASS: $PYATS_PASS"
echo "PYATS_ENABLE_PASS: $PYATS_ENABLE_PASS"

# Append the export commands to the shell configuration file for persistence
echo "export PYATS_USER=\"$user\"" >> ~/.zshrc
echo "export PYATS_PASS='$pass'" >> ~/.zshrc
echo "export PYATS_ENABLE_PASS='$enable_pass'" >> ~/.zshrc

# Source the shell configuration file to apply changes immediately
source ~/.zshrc
