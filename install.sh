#!/bin/bash

DOTFILES_PATH="$HOME/.dotfiles"
NVIM_PATH="$HOME/.config/nvim"
FISH_PATH="$HOME/.config/fish"

echo "Install brew"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Create neovim and fish config folder"
mkdir -r $NVIM_PATH
mkdir -r $FISH_PATH

echo "Clone repo"
git clone https://github.com/willianba/dotfiles.git $DOTFILES_PATH

echo "Install apps"
xargs brew install < $DOTFILES_PATH/brew_programs_list

echo "Install docker"
sh $DOTFILES_PATH/scripts/docker-install.sh

echo "Set config files"
ln -sf $DOTFILES_PATH/.gitconfig $HOME
ln -sf $DOTFILES_PATH/lazy/* $NVIM_PATH
ln -sf $DOTFILES_PATH/fish $FISH_PATH

fish
