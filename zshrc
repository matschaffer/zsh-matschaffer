source "$HOME/.antigen/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  ssh-agent
  autojump
  git
  npm
  command-not-found

  zsh-users/zsh-syntax-highlighting
  mafredri/zsh-async
  sindresorhus/pure
  matschaffer/zsh-matschaffer
EOBUNDLES

# Shift-tab to force complete for files
zle -C complete complete-word complete-files
bindkey '^[[Z' complete
complete-files () { compadd - $PREFIX* }

antigen apply

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
