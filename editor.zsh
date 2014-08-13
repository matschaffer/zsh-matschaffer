alias vi='mvim -v'

alias es='/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n'

# Set default editor to vi but keep emacs zsh bindings
#export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c'
export EDITOR="mvim -v"
bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
