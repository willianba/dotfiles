alias reload="exec zsh"

alias lg="lazygit"

alias k="kubectl"
alias awsp="change_aws_profile"
alias tx="export_terraform_variables"

alias cza="change_zsh_arch"

### METHODS ###
change_aws_profile () {
  export AWS_PROFILE=$1
  echo "AWS_PROFILE set to $1"
}

export_terraform_variables () {
  change_aws_profile ${1:-terraform}
  export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
  export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
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
