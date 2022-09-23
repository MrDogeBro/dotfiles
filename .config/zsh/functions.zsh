# =========================================
#               general
# =========================================
# fuzzy find a command in history and then run
hr () { eval $(history | sort -rn | sed 's/ *[0-9]* *//' | fzf --no-sort) }

# fuzzy find ls output
lsf () { command ls -A $1 | fzf }

# =========================================
#               nicer git
# =========================================
# git add commit
gac () {
  message=${@:$#}
  files=(${@:1:$# - 1})

  for file in $files; do
    git add "$file"
  done

  git commit -m "$message"
}

# git add commit push
gacp () {
  message=${@:$#}
  files=(${@:1:$# - 1})

  for file in $files; do
    git add "$file"
  done

  git commit -m "$message"
  git push
}

# git commit push
gcap () {
dot commit -m "$1"
dot push
}

# dotfiles add commit
dac () {
  message=${@:$#}
  files=(${@:1:$# - 1})

  for file in $files; do
    dot add "$file"
  done

  dot commit -m "$message"
}

# dotfiles add commit push
dacp () {
  message=${@:$#}
  files=(${@:1:$# - 1})

  for file in $files; do
    dot add "$file"
  done

  dot commit -m "$message"
  dot push
}

# dotfiles commit push
dcap () {
  dot commit -m "$1"
  dot push
}

# =========================================
#               utils
# =========================================
# kill firebase process by port
fbkill () {
  processId=$(lsof -nP -iTCP -sTCP:LISTEN | grep $1 | awk '{ print $2 }')
  kill $processId 
}

# update to a new python version with dependencies
pyupdate () {
  if [ -z "$1" ]; then
    echo "New python version not passed in!"
    return 1
  fi

  echo "Upgrading pip..."
  pip install -U pip
  echo -e "Pip upgraded\n\nPick which dependencies to transfered..."
  
  packagesKeep=("setuptools" "wheel" "pip" "pynvim")

  packages=($(pip list | awk '(NR>2) {print $1}'))
  newPackages=()

  for i in "${packages[@]}"; do
    for k in "${packagesKeep[@]}"; do
      if [[ "$i" == "$k" ]]; then
        newPackages+=("$i")
        continue 2
      fi
    done

    read choise"?Would you like to keep the package \"$i\"? (Y/n): "

    if [ "$choise" != "" ] && [[ "$choise" == "n" ]]; then
      echo "Not transfering package \"$i\""
      continue
    fi

    newPackages+=("$i")
  done

  echo -e "Dependencies to transfer picked\n\nInstalling python $1..."

  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "    Updating pyenv (via brew)..."
    brew update && brew upgrade pyenv
    echo -e "    Pyenv updated\n"
  fi

  pyenv install -s $1
  pyenv global $1

  echo -e "Python $1 installed\n\nTransfering dependencies..."

  pip install "${newPackages[@]}"

  echo -e "Dependencies transfered\n\nDone!" 
}

get_latest_gh_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

pocketclone () {
  tag=$(get_latest_gh_release pocketbase/pocketbase)
  file=pocketbase_$(echo $tag | awk 'sub(/^.{1}/,"")')_darwin_arm64.zip

  wget https://github.com/pocketbase/pocketbase/releases/download/$tag/$file

  tar -xvzf $file
  rm -rf LICENSE.md $file
}

# =========================================
#               background
# =========================================
# cross platform colored output for ls
__colored_ls () {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then command ls --color $@
  else command ls -G $@
  fi
}
