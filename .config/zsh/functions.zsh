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
#               background
# =========================================
# cross platform colored output for ls
__colored_ls () {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then command ls --color $@
  else command ls -G $@
  fi
}
