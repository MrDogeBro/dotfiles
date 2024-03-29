# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='lvim'
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
if [ -d "$HOME/Programs/RandomScripts" ]; then
  source "$HOME/Programs/RandomScripts/bin/add-to-path.sh"
fi

# add pio cli to path
if [ -d "$HOME/.platformio/penv/bin" ]; then
  export PATH="$PATH:$HOME/.platformio/penv/bin"
fi

# add lvim to path
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

#add yarn bin to path
if [ -x "$(command -v yarn)" ]; then
  export PATH="$PATH:$(yarn global bin)"
fi

# macos only
if [[ "$OSTYPE" == "darwin"* ]]; then
  # add postgresql to path
  if [ -d "/Library/PostgreSQL/10/bin" ]; then
    export PATH="$PATH:/Library/PostgreSQL/10/bin"
  fi

  # add nginx to path
  if [ -d "/usr/local/nginx/sbin" ]; then
    export PATH="$PATH:/usr/local/nginx/sbin"
  fi

  # add macports to path
  if [ -d "/opt/local/bin" ]; then
    export PATH=$PATH:/opt/local/bin:/opt/local/sbin
  fi

  # make brew not update on pkg install
  if [ -x "$(command -v brew)" ]; then
    export HOMEBREW_NO_AUTO_UPDATE=1
  fi
fi

# set command for fzf to use
export FZF_DEFAULT_COMMAND='rg --files --hidden'
