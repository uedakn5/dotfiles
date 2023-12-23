# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ "$(id -u)" -ne 0 ]; then
	PATH=$PATH:$HOME/.local/bin:$HOME/bin
fi
export PATH=~/.local/bin:/home/ueda/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ueda/bin
export MANPATH=~/.local/share/man:/home/ueda/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ueda/bin
