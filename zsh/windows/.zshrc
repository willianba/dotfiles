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

# bun completions
[ -s "/home/willianba/.bun/_bun" ] && source "/home/willianba/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_INSTALL="/home/willianba/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# fzf
source <(fzf --zsh)
## update fzf's fd config
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-config --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-config --exclude .git"

# cmake
export PATH="/opt/cmake-3.30.0-linux-x86_64/bin:$PATH"

# Turso
export PATH="/home/willianba/.turso:$PATH"
