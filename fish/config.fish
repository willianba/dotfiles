if status is-interactive
    # Commands to run in interactive sessions can go here
end

# add brew binaries to path
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

# add deno
export DENO_INSTALL="/home/ethan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

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

# github aliases
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcd='git checkout dev'
alias gu='git fetch --prune && git pull'

# set fortune as welcome message
# function fish_greeting
#   echo "--------------------"
#   fortune
#   echo "--------------------"
# end

# disable welcome message
set fish_greeting

# Created by `pipx` on 2024-08-11 19:00:09
set PATH $PATH /home/ethan/.local/bin
