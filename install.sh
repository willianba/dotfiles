#!/bin/bash
echo "Update and Install ZSH"
sudo apt-get update
sudo apt-get -y install zsh

echo "Install oh-my-zsh"
curl -Lo install-oh-my-zsh.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install-oh-my-zsh.sh --unattended

echo "Set ZSH default shell"
chsh -s $(which zsh)

echo "Install Powerlevel10k"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "Install oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

echo "Clone repo"
git clone https://github.com/willianba/dotfiles.git

echo "Set config files"
mv dotfiles/.gitconfig ~
mv dotfiles/.zshrc ~
mv dotfiles/zsh/*.zsh ~/.oh-my-zsh/custom/

echo "Delete remaining files"
rm install-oh-my-zsh.sh
rm -rf dotfiles

echo "Start ZSH"
zsh
