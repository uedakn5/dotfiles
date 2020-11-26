# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

case "${OSTYPE}" in
  darwin*)
    alias ls="ls -CFG"
    alias ll="ls -lFhG"
    alias la="ls -CFalG"
    ;;
  linux*)
    alias ls='ls -CF --color'
    alias ll='ls -lFh --color'
    alias la='ls -CFal --color'
    ;;
esac

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
