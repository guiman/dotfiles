# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function parse_git_branch() {
  __git_ps1
}

# bash
export PS1='\w$(parse_git_branch)% '
export CLICOLOR=1

# bundler aliases
alias be='bundle exec'
alias bi='bundle install'
alias bs='bundle show'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"