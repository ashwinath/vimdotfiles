#!/bin/bash
mv ~/.vimrc ~/.vimrc.bak
cp .vimrc ~/.vimrc;
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak;
cp .vimrc ~/.config/nvim/init.vim;

# create folders for editing
mkdir -p ~/.vim/backup
