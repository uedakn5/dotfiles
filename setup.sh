#!/bin/bash

set -eu

DOT_FILES=(bashrc bash_profile screenrc vimrc gitconfig)
NVIM_DIR="${HOME}/.config/nvim"
VIM_DIR="${HOME}/.vim"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILEPATH="${SCRIPT_DIR}"
LOCAL_GITCONFIG="${HOME}/.gitconfig.local"

link_file() {
  src=$1
  dest=$2
  mkdir -p "$(dirname "$dest")"
  ln -nfs "$src" "$dest"
}

is_wsl() {
  [ -n "${WSL_DISTRO_NAME-}" ] || [ -n "${WSL_INTEROP-}" ] || grep -qi microsoft /proc/version 2>/dev/null
}

write_local_gitconfig() {
  if is_wsl; then
    cat > "$LOCAL_GITCONFIG" <<'EOF'
[core]
    sshCommand = ssh.exe
EOF
  else
    : > "$LOCAL_GITCONFIG"
  fi
}

for file in "${DOT_FILES[@]}"; do
  link_file "$DOTFILEPATH/$file" "$HOME/.$file"
done

write_local_gitconfig

mkdir -p "$NVIM_DIR/after" "$VIM_DIR/after"

link_file "$DOTFILEPATH/init.lua" "$NVIM_DIR/init.lua"
link_file "$DOTFILEPATH/rc" "$NVIM_DIR/rc"
link_file "$DOTFILEPATH/rc" "$VIM_DIR/rc"
link_file "$DOTFILEPATH/colors" "$VIM_DIR/colors"
link_file "$DOTFILEPATH/vimrc" "$HOME/.vimrc"
link_file "$DOTFILEPATH/bin" "$HOME/bin"
link_file "$DOTFILEPATH/ftplugin" "$NVIM_DIR/after/ftplugin"
link_file "$DOTFILEPATH/ftplugin" "$VIM_DIR/after/ftplugin"
link_file "$DOTFILEPATH/plugin" "$NVIM_DIR/after/plugin"
link_file "$DOTFILEPATH/plugin" "$VIM_DIR/after/plugin"
