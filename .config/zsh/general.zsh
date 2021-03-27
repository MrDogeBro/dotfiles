ZSH_DISABLE_COMPFIX=true
HYPHEN_INSENSITIVE="true"

# remove user from prompt
DEFAULT_USER="$(whoami)"

# zsh plugins
plugins=(git gitignore virtualenv sudo vi-mode)

# pulls in oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load cli functions
eval "$(zoxide init zsh)"
eval "$(quicknav init zsh)"

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# ========= Plugin Config =========
# vi-mode
VI_MODE_SET_CURSOR=false
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
