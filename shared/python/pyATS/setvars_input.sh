#!/bin/zsh

# Prompt for user input
read -p "Enter your username: " your_user
read -s -p "Enter your password: " your_pass
echo    # Move to the next line after password input
read -s -p "Enter your enable password: " your_enable_pass
echo    # Move to the next line after enable password input

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
