#!/bin/bash

DOT_FILES=(bashrc zshrc bash_profile screenrc nvimrc gitconfig)
NVIM_DIR="${HOME}/.config/nvim"
VIM_DIR="${HOME}/.vim"
DOTFILENAME="dotfiles"
DOTFILEPATH="${HOME}/${DOTFILENAME}"

for file in ${DOT_FILES[@]}
do
  ln -nfs $DOTFILEPATH/$file $HOME/.$file
done

# mkdir -p $HOME/.config/fish
# ln -nfs $HOME/dotf/config.fish $HOME/.config/fish/config.fish
# ln -nfs $HOME/dotf/config.fish $HOME/config.fish

mkdir -p $NVIM_DIR
mkdir -p $VIM_DIR
ln -nfs $DOTFILEPATH/nvimrc ${NVIM_DIR}/init.vim
if [ ! -d ${NVIM_DIR}/rc ]; then
  ln -nfs $DOTFILEPATH/rc ${NVIM_DIR}/rc
fi
if [ ! -d ${VIM_DIR}/rc ]; then
  ln -nfs $DOTFILEPATH/rc ${VIM_DIR}/rc
fi
ln -nfs $DOTFILEPATH/colors ${VIM_DIR}/colors
ln -nfs $DOTFILEPATH/nvimrc $HOME/.vimrc
ln -nfs $DOTFILEPATH/bin $HOME/bin
ln -nfs $HOME/dotf/ftplugin ${NVIM_DIR}/after/ftplugin
ln -nfs $HOME/dotf/ftplugin ${VIM_DIR}/after/ftplugin
