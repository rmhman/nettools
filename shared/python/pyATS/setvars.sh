#!/bin/zsh

# Assign your credentials here
your_user="username"
your_pass="password"
your_enable_pass="enablepassword"

# Set the environment variables for the current shell
export PYATS_USER="$your_user"
export PYATS_PASS="$your_pass"
export PYATS_ENABLE_PASS="$your_enable_pass"

# Print a message
echo "Environment variables set:"
echo "PYATS_USER: $PYATS_USER"
echo "PYATS_PASS: $PYATS_PASS"
echo "PYATS_ENABLE_PASS: $PYATS_ENABLE_PASS"

# Append the export commands to the shell configuration file for persistence
echo "export PYATS_USER=\"$your_user\"" >> ~/.zshrc
echo "export PYATS_PASS=\"$your_pass\"" >> ~/.zshrc
echo "export PYATS_ENABLE_PASS=\"$your_enable_pass\"" >> ~/.zshrc

# Source the shell configuration file to apply changes immediately
source ~/.zshrc