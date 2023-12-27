#!/bin/bash

if [ -d /shared/keys ]; then 
  cp -r /shared/keys /root/.ssh/
  chmod 600 /root/.ssh/keys/*
fi
if [ -f /shared/config ]; then 
  cp  /shared/config /root/.ssh/
fi
if [ -f /shared/.zsh_aliases ]; then 
  cp  /shared/.zsh_aliases /root/
  . /root/.zsh_aliases
fi
if [ -f /shared/.zsh_functions ]; then 
  cp  /shared/.zsh_functions /root/
  . /root/.zsh_functions
fi