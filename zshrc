#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

prompt agnoster

#. ~/zsh-history-substring-search.zsh

bindkey "OA" history-beginning-search-backward
bindkey "OB" history-beginning-search-forward

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "OA" history-beginning-search-backward-end

alias l='ls -la'
alias add='git add'
alias commit='git commit'
alias push='git push'
alias pull='git pull'

bindkey -s "[24~" "git push
"
bindkey -s "[20~" "git status
"
bindkey -s "[15~" "git pull
"
bindkey -s "OQ" "cd ~/PythonCodeExercises/SearchPlayer
"

export TERM="xterm-256color"

if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:/usr/local/go/bin:/usr/local/hadoop/bin/
export GOPATH=$HOME/GoProjects:/home/gabriele/GoProjects/github.com/codezapper/BinarySearch
export GOBIN=$GOPATH/bin

