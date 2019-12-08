if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#eval "$(rbenv init -)"
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/berkeley-db@4/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/egapool/src/google-cloud-sdk/path.bash.inc' ]; then . '/Users/egapool/src/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/egapool/src/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/egapool/src/google-cloud-sdk/completion.bash.inc'; fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
