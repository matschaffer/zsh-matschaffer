alias vi='mvim -v'

# Set default editor to vi but keep emacs zsh bindings
export EDITOR='mvim -v'
bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
