# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# add cargo to path
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
else
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# add ruby to path
if [ -f "/usr/local/opt/ruby/bin" ]; then
  export PATH="/usr/local/opt/ruby/bin:$PATH"
fi

# add python scripts bin to path
if [ -d "$HOME/Documents/Projects/RandomScripts" ]; then
  source "$HOME/Documents/Projects/RandomScripts/bin/add-to-path.sh"
fi

# add pio cli to path
if [ -d "$HOME/.platformio/penv/bin" ]; then
  export PATH="$PATH:$HOME/.platformio/penv/bin"
fi

# add lvim to path
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [ -x "$(command -v brew)" ]; then
  export HOMEBREW_NO_AUTO_UPDATE=1
fi

# set command for fzf to use
export FZF_DEFAULT_COMMAND='rg --files --hidden'
