alias vi='mvim -v'

export EDITOR=vi

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
