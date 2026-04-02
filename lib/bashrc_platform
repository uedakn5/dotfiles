#!/bin/bash

is_wsl() {
  [ -n "${WSL_DISTRO_NAME-}" ] || [ -n "${WSL_INTEROP-}" ] || grep -qi microsoft /proc/version 2>/dev/null
}

is_ssh_session() {
  [ -n "${SSH_TTY-}" ] || [ -n "${SSH_CONNECTION-}" ]
}
