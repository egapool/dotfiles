
source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true

# history にコマンド実行時刻を記録する
HISTTIMEFORMAT='%Y-%m-%d %T '
# historyの数を50000に指定
HISTSIZE=10000

#PS1='[\u@\h \W]$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '
#PS1='\h \W $(__git_ps1 "\[\[\033[32m\]%s\[\033[0m\]\]")\$ '
PS1='\W\[\e[1;32m $(__git_ps1 "%s") \[\e[0m\]\$ '
export LSCOLORS=gxfxcxdxbxegedabagacad

alias dev='cd ~/Develop/'
alias cent='cd ~/Develop/centos64/'
alias pub='cd ~/Develop/vagrant/centos64/public_html'
alias la='ls -la'
alias ls='ls -FG'
alias v='vim'
alias g='git'
alias t='tig'
alias vg='vagrant'
alias d='docker'
alias dc='docker-compose'
alias jn='jupyter notebook'
alias bc='bitcoin-cli'
alias sblp='subl $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'
alias atmp='atom $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'
alias pro='cd $(ls ~/Develop/projects | peco | xargs -I % echo ~/Develop/projects/%)'
alias gop='cd $( ghq list --full-path | peco | xargs -I % echo /%)'
alias s='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias xdebug-disable='echo "" > /usr/local/etc/php/7.1/conf.d/xdebug.ini'
alias xdebug-restore='cat /usr/local/etc/php/7.1/conf.d/xdebug.ini.back > /usr/local/etc/php/7.1/conf.d/xdebug.ini'
alias xdebug-restore-cli='cat /usr/local/etc/php/7.1/conf.d/xdebug.cli.ini.back > /usr/local/etc/php/7.1/conf.d/xdebug.ini'
alias less='less -S'

alias release-diff="git log --merges --first-parent --reverse --pretty=format:'- [ ] %s %n %b %n' remotes/origin/master..remotes/origin/develop | sed -e 's/#\([0-9]\{4\}\)/https:\/\/github.com\/aerialpartners\/gtax-server\/pull\/\1/g' | sed -e 's/from aerialpartners\/feature\///g' | pbcopy;pbpaste"


export GOPATH=~/Develop/go
export PATH=/usr/local/Cellar/vim/8.1.1750/bin:$PATH
export PATH=/usr/local/opt/curl/bin:/usr/local/bin/git/:~/bin:~/.composer/vendor/bin:$GOPATH/bin:/usr/local/opt/gettext/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# lessの設定
# export LESS=eFRX

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

function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/config | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    ssh ${selected_host}
  fi
}
bind -x '"\C-s":peco-ssh'


# for local lnd
alias lncli-alice="lncli --rpcserver=localhost:10001 --no-macaroons"
alias lncli-bob="lncli --rpcserver=localhost:10002 --no-macaroons"
alias lncli-charlie="lncli --rpcserver=localhost:10003 --no-macaroons"


# for local docker bitcoin-cli
alias d-bitcoin-cli="docker exec --user bitcoin bitcoin-server bitcoin-cli -regtest -rpcuser=devuser -rpcpassword=devpass"
