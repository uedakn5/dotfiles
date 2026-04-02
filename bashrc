#!/bin/bash

# Source global definitions.
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f "$HOME/dotfiles/lib/bashrc_env" ]; then
  . "$HOME/dotfiles/lib/bashrc_env"
fi

if [ -f "$HOME/dotfiles/lib/bashrc_platform" ]; then
  . "$HOME/dotfiles/lib/bashrc_platform"
fi

case $- in
  *i*) ;;
  *)
  return 0 2>/dev/null || exit 0
    ;;
esac

if [ -f "$HOME/dotfiles/lib/bashrc_interactive" ]; then
  . "$HOME/dotfiles/lib/bashrc_interactive"
fi

if [ -f "$HOME/dotfiles/lib/bashrc_prompt" ]; then
  . "$HOME/dotfiles/lib/bashrc_prompt"
fi

if [ -f "$HOME/dotfiles/lib/bashrc_screen" ]; then
  . "$HOME/dotfiles/lib/bashrc_screen"
fi
