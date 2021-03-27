ZSH_DISABLE_COMPFIX=true
HYPHEN_INSENSITIVE="true"

# remove user from prompt
DEFAULT_USER="$(whoami)"

# zsh plugins
plugins=(git gitignore virtualenv sudo vi-mode)

# pulls in oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load cli functions
if [ -x "$(command -v zoxide)" ]; then
  eval "$(zoxide init zsh)"
fi

if [ -x "$(command -v quicknav)" ]; then
  eval "$(quicknav init zsh)"
fi

if [ -x "$(command -v pyenv)" ]; then
  eval "$(pyenv init -)"
fi

# ========= Plugin Config =========
# vi-mode
VI_MODE_SET_CURSOR=false
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
