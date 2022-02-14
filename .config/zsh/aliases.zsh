# shortened commands
alias c="clear"
alias n="nav"
alias qn="quicknav"
alias p="ping 8.8.8.8"
alias p30="ping -i 30 8.8.8.8"

# nicer ls
alias ls="__colored_ls -lAho"
alias dls="__colored_ls"

# fuzzy history
alias hf="history | sort -rn | sed 's/ *[0-9]* *//' | fzf --no-sort"

# reload commands
alias rzsh="source ~/.zshrc"

# safe destructive commands
alias rm="rm -i"
alias mv="mv -i"

# managing dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias da="dot add"
alias dc="dot commit"
alias dp="dot push"
alias dst="dot status -sb"

# shorthand git
alias gst="git status -sb"
alias glog="git log --graph --date=format-local:\"%T %m-%d-%y\" --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"
alias glr="git pull --rebase"
alias glru="git pull --rebase upstream"

# shorthand python venv
alias va="source .venv/bin/activate"
alias vd="deactivate"

# neovim alias
alias nv="VIMRUNTIME=$HOME/builds/neovim/runtime $HOME/builds/neovim/build/bin/nvim"
# alias nv="VIMRUNTIME=$HOME/builds/neovim/runtime $HOME/builds/neovim/build/bin/nvim -u $HOME/.config/nvim-nightly/init.lua"

# shorthand clasp
alias cpr="clasp push && clasp run"
alias cr="clasp run"

# linux only
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # fix alacritty font size on linux
  alias alacritty="command alacritty --option font.size=8.5"

  # shorthand pacman
  alias pac="pacman"
  alias spac="sudo pacman"
fi

# macos only
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ngxconf="$EDITOR /opt/homebrew/etc/nginx/nginx.conf"
  alias bs="brew services"
fi
