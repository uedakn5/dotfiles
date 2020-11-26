#!/bin/bash

DOT_FILES=(bashrc bash_profile screenrc nvimrc)
NVIM_DIR="${HOME}/.config/nvim"
VIM_DIR="${HOME}/.vim"

for file in ${DOT_FILES[@]}
do
  ln -is $HOME/dotf/$file $HOME/.$file
done

# mkdir -p $HOME/.config/fish
# ln -is $HOME/dotf/config.fish $HOME/.config/fish/config.fish
# ln -is $HOME/dotf/config.fish $HOME/config.fish

mkdir -p $NVIM_DIR
mkdir -p $VIM_DIR
ln -is $HOME/dotf/nvimrc ${NVIM_DIR}/init.vim
if [ ! -d ${NVIM_DIR}/rc ]; then
  ln -s $HOME/dotf/rc ${NVIM_DIR}/rc
fi
if [ ! -d ${VIM_DIR}/rc ]; then
  ln -s $HOME/dotf/rc ${VIM_DIR}/rc
fi
ln -is $HOME/dotf/colors ${VIM_DIR}/colors
ln -is $HOME/dotf/nvimrc $HOME/.vimrc

# ln -is $HOME/dotf/ftplugin ${NVIM_DIR}/after/ftplugin
# ln -is $HOME/dotf/ftplugin ${VIM_DIR}/after/ftplugin
