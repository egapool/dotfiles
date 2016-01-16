source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
export LSCOLORS=gxfxcxdxbxegedabagacad

alias dev='cd ~/Develop/'
alias cent='cd ~/Develop/centos64/'
alias pub='cd ~/Develop/vagrant/centos64/public_html'
alias la='ls -la'
alias ls='ls -FG'
alias vi='vim'
alias g='git'
alias t='tig'
export PATH=$PATH:/usr/local/bin/git/:~/bin/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# python
export PYENV_ROOT=/usr/local/opt/pyenv
