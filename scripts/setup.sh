#!/bin/sh

set -e

if ! [[ -d ~/.zsh/bundle/zundle ]]; then
  git clone http://github.com/matschaffer/zundle.git ~/.zsh/bundle/zundle
fi

if ! [[ -d ~/.zsh/bundle/zsh-matschaffer ]]; then
  git clone http://github.com/matschaffer/zsh-matschaffer.git ~/.zsh/bundle/zsh-matschaffer
fi

test -f ~/.zshrc && mv ~/.zshrc ~/.zshrc.bak

ln -s ~/.zsh/bundle/zsh-matschaffer/zshrc ~/.zshrc
