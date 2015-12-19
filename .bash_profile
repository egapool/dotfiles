if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi