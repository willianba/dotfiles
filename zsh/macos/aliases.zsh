alias reload="exec zsh"

alias lg="lazygit"
alias z="zoxide"

alias ls="eza"

alias k="kubectl"
alias awsp="change_aws_profile"

alias cza="change_zsh_arch"

alias uuid="generate_uuid"

alias myip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com"

### METHODS ###
change_aws_profile () {
  export AWS_PROFILE=$1
  echo "AWS_PROFILE set to $1"
}

change_zsh_arch () {
  CURRENT_ARCH=$(arch)
  if [ $CURRENT_ARCH = "i386" ]; then
    ZSH_ARCH="arm64"
  else
    ZSH_ARCH="x86_64"
  fi
  arch -$ZSH_ARCH zsh
}

generate_uuid () {
  uuidgen | awk '{print tolower($0)}'
}
