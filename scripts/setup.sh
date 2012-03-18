#!/bin/sh

set -e

if [[ -n "$RW" ]]; then
  PREFIX="git@github.com:"
else
  PREFIX="https://github.com/"
fi

if ! [[ -d ~/.zsh/bundle/zundle ]]; then
  git clone ${PREFIX}matschaffer/zundle.git ~/.zsh/bundle/zundle
fi

if ! [[ -d ~/.zsh/bundle/zsh-matschaffer ]]; then
  git clone ${PREFIX}matschaffer/zsh-matschaffer.git ~/.zsh/bundle/zsh-matschaffer
fi

test -f ~/.zshrc && mv ~/.zshrc ~/.zshrc.bak
ln -s ~/.zsh/bundle/zsh-matschaffer/zshrc ~/.zshrc

source ~/.zshrc

BundleInstall
