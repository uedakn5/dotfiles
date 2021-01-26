#!/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ "$(id -u)" -ne 0 ]; then
	. $HOME/dotfiles/lib/bashrc_core
	. $HOME/dotfiles/lib/common
fi
