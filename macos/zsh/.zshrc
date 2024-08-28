
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="sorin"
zstyle ':omz:update' mode auto # update automatically without asking

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export EDITOR='nvim'

### Sourcing files and binaries below
# GO
export PATH=$PATH:~/go/bin

# Deno
export DENO_INSTALL="/Users/willianba/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ngrok autocompletion
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# zoxide startup
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# mise
eval "$(~/.local/bin/mise activate zsh)"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# moon
export PATH="/Users/willianba/.moon/bin:$PATH"

# fzf
source <(fzf --zsh)
## Use fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"


# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

## fzf theme
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#cad3f5,fg+:#b8c0e0,bg:#181926,bg+:#24273a
#   --color=hl:#f5bde6,hl+:#c6a0f6,info:#91d7e3,marker:#a6da95
#   --color=prompt:#ed8796,spinner:#b7bdf8,pointer:#f0c6c6,header:#7dc4e4
#   --color=border:#494d64,label:#8087a2,query:#8aadf4
#   --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
#   --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'

