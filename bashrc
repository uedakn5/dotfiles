#!/bin/bash
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=$PATH:~/bin

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
# PS1の設定

C() {
  case $1 in
    black)    echo -e -n "\033[1;30m";;
    red)      echo -e -n "\033[1;31m";;
    green)    echo -e -n "\033[1;32m";;
    yellow)   echo -e -n "\033[1;33m";;
    blue)     echo -e -n "\033[1;34m";;
    magenta)  echo -e -n "\033[1;35m";;
    cyan)     echo -e -n "\033[1;36m";;
    white)    echo -e -n "\033[1;37m";;
    backcyan) echo -e -n "\033[1;46m";;
    *) echo -e -n "\033[0m";;
  esac
}

ps1_rails() {
  if [ -z "${RAILS_ENV-}" ]; then
    return
  fi
  echo -n " RAILS_ENV=$(C white)$RAILS_ENV$(C reset)"
}

ps1_login() {
	echo -n "$(C green)${USER}$(C reset)@"
  echo -n -e "$(C cyan)$(hostname -s)$(C reset)"
}

ps1_date() {
  date +'%F %H:%M:%S'
}

ps1_exit_status() {
  local END_CODE=$1
  echo -n ' $?='
  if [ 0 -ne "${END_CODE}" ]; then
    echo -n "$(C red)${END_CODE}$(C reset)"
  else
    echo -n 0
  fi
}

ps1_git() {
  if ! git status --ignore-submodules &>/dev/null; then
    return
  fi
  echo -n ' '
  git-ps
}

ps1_java() {
  if [ -n "${JAVA_HOME}" ]; then
    local version
    version=$(java -version |& head -1 | cut -d ' ' -f 3 | tr -d '"')
    echo -n " java=$(C white)${version}$(C reset)"
  fi
}

ps1_prompt() {
  if [ "$(id -u)" -eq 0 ]; then
    echo -n "$(C red)# $(C reset)"
  else
    echo -n "$(C "${HOST_COLOR}")$ $(C reset)"
  fi
}

ps1_path() {
	echo " $(C blue)$(pwd | sed -e "s|^${HOME%/}|~|")$(C reset)"
}

function ps1_info() {
  local END_CODE=$?
	echo "$(C backcyan):$(C reset)$(ps1_login)$(ps1_exit_status "$END_CODE")$(ps1_git)$(ps1_rails)$(ps1_java) "
	echo "$(C backcyan):$(C reset)$(ps1_date)$(ps1_path)"
}

PS1='$(ps1_info)'


# カーソル位置がずれる問題を回避するため、ここの部分だけは文字列連結にする
if [ "$(id -u)" -eq 0 ]; then
  PS1="${PS1}\n\[$(C red)\]#\[$(red)\] "
else
  PS1="${PS1}\n\[$(C cyan)\]\$\[$(C reset)\] " # 非rootユーザの場合はドル
fi

export PS1

if [ "$TERM" != 'screen' -a "$TERM" != 'dumb' ]
then
  [ `which screen 2>/dev/null` ] && screen -rx || screen -D -RR
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
