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
alias vg='vagrant'
alias d='docker'
alias dc='docker-compose'
alias jn='jupyter notebook'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
alias sblp='subl $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'
alias atmp='atom $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'
alias pro='cd $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'

# python
export PYENV_ROOT=/usr/local/opt/pyenv
#pecoの設定
export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi
    else
        history -d $((HISTCMD-1))
    fi
}
bind -x '"\C-r":peco-history'
