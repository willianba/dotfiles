#!/bin/bash

DOTFILES_PATH="$HOME/.dotfiles"
NVIM_PATH="$HOME/.config/nvim"
OHMYZSH_CUSTOM_PATH="$HOME/.oh-my-zsh/custom"

echo "Update and Install ZSH"
sudo apt-get update
sudo apt-get -y install zsh

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Set ZSH default shell"
chsh -s $(which zsh)

echo "Install oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions $OHMYZSH_CUSTOM_PATH/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git $OHMYZSH_CUSTOM_PATH/plugins/fast-syntax-highlighting

echo "Install apps"
brew install docker --cask
brew install neovim ripgrep fd

echo "Install NvChad"
git clone https://github.com/NvChad/NvChad $NVIM_PATH --depth 1
mkdir $NVIM_PATH/lua/custom

echo "Clone repo"
git clone https://github.com/willianba/dotfiles.git $DOTFILES_PATH

echo "Set config files"
ln -sf $DOTFILES_PATH/.gitconfig $HOME
ln -sf $DOTFILES_PATH/zsh/.zshrc $HOME
ln -sf $DOTFILES_PATH/zsh/*.zsh $OHMYZSH_CUSTOM_PATH
ln -sf $DOTFILES_PATH/nvim/* $NVIM_PATH/lua/custom/

zsh
