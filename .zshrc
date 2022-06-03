export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="sorin"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=pt_BR.UTF-8
export DISPLAY=:0

# Start Docker daemon automatically when logging in if not running.
RUNNING=`ps aux | grep dockerd | grep -v grep`
if [ -z "$RUNNING" ]; then
  sudo /usr/sbin/service docker start > /dev/null 2>&1 &
  disown
fi
