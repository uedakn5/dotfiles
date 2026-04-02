# dotfiles

This repository is organized around `bash`, `vim`, and `neovim`.

- Shell: `bash` only
- Multiplexer: `screen`
- Not used: `zsh`, `tmux`

## Setup

Run `./setup.sh` to install symlinks for the active dotfiles.

## Notes

- `zsh` and `tmux` configuration have been removed from the active setup on purpose.
- `bashrc` is the entry point for interactive shell behavior.
- `lib/bashrc_core` remains only as a compatibility shim for older references.
- `init.lua` is the source of truth for Neovim.
- `vimrc` is the legacy Vim configuration.
- `DOTFILES_SCREEN_MODE=auto` starts `screen` only for SSH sessions.
- `DOTFILES_SCREEN_MODE=always` always starts `screen`.
- `DOTFILES_SCREEN_MODE=never` never starts `screen`.
