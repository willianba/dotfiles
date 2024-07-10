if status is-interactive
    # Commands to run in interactive sessions can go here
end

# add brew binaries to path
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# set default editor to nvim
set -x EDITOR nvim

# oh-my-posh
oh-my-posh init fish --config ~/.config/fish/themes/redmac.opp.json | source

# zoxide
zoxide init fish | source

# set language english
set -x LANG en_US.UTF-8

# alias
alias vim='nvim'
alias cls='clear'
alias ll='ls -la'
alias lzd='lazydocker'
alias lg='lazygit'
# alias git='git.exe'

# set fortune as welcome message
# function fish_greeting
#   echo "--------------------"
#   fortune
#   echo "--------------------"
# end

# disable welcome message
set fish_greeting
