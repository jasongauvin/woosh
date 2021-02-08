#!/bin/bash
tmux new-session \; \
  send-keys 'htop' C-m \; \
  split-window -v -p 66 \; \
  split-window -h -p 50 \; \
  send-keys 'cd ~/_/CONFIG/dotfiles ; bash woo.sh' C-m \; \
  select-pane -t 1 \; \
  send-keys 'clear ; cd ; date ; printf "\n" ; hostnamectl' C-m \; \
  split-window -v \; \
  send-keys 'cd ~/_ ; clear ; ls -l' C-m \; \
  setw -g mouse on