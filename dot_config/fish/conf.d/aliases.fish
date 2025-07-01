# Basic aliases
alias reload="exec fish"
alias lg="lazygit"
alias ld="lazydocker"
alias z="zoxide"

# eza to ls aliases
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                   # show only dotfiles

# Kubernetes aliases
alias k="kubectl"
alias kctx="kubectl config use-context"

# Custom aliases
alias awsp="change_aws_profile"
alias cza="change_zsh_arch"
alias uuid="generate_uuid"
alias myip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '\"'"
