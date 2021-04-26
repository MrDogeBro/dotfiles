#!/bin/bash

# if [ -x "$(command -v pyenv)" ]; then
  # search="/.pyenv/"
# else
search="/usr/"
# fi

path=$(which -a python3 | rg "$search" | awk '{print; exit}')
echo "$path"
