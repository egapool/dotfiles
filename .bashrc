source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '

alias dev='cd ~/Develop/public/'
alias cent='cd ~/Develop/centos64/'
alias la='ls -la'

export PATH=$PATH:/Applications/MAMP/bin/php/php5.4.4/bin:/usr/local/bin/git/:~/bin/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# python
export PYENV_ROOT=/usr/local/opt/pyenv