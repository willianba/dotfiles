export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sorin"
zstyle ':omz:update' mode auto # update automatically without asking

plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='nvim'

# Start Docker daemon automatically when logging in if not running.
# if [ -n "`service docker status | grep not`" ]; then
#   sudo /usr/sbin/service docker start
# fi

export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(zoxide init zsh --cmd cd)"
