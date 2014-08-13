source "$HOME/.zsh/bundle/zundle/rc"

Bundle 'matschaffer/zsh-history'
Bundle 'matschaffer/zsh-git'
Bundle 'matschaffer/zsh-rvm'
Bundle 'matschaffer/zsh-autojump'
Bundle 'matschaffer/zsh-heroku'
Bundle 'matschaffer/zsh-groovy'
Bundle 'matschaffer/zsh-vagrant'
#Bundle 'matschaffer/zsh-grails'

Bundle 'matschaffer/zsh-theme-gnzh'
Bundle 'matschaffer/zsh-matschaffer'

LoadBundles

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/matschaffer/.gvm/bin/gvm-init.sh" ]] && source "/Users/matschaffer/.gvm/bin/gvm-init.sh"
