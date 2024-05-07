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

export PATH=~/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:~/bin
export MANPATH=~/.local/share/man:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:~/bin
