# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

prompt skwp

bindkey "OA" history-beginning-search-backward
bindkey "OB" history-beginning-search-forward

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "OA" history-beginning-search-backward-end

alias l='ls -la'
alias add='git add'
alias commit='git commit'
alias push='git push'
alias pull='git pull'

bindkey -s "[24~" "git push
"
bindkey -s "[20~" "git status
"
bindkey -s "[15~" "git pull
"

if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GIT_PROMPT_EXECUTABLE="haskell"
source ~/.zsh-git-prompt/zshrc.sh

export PATH=$PATH:~/.zsh-git-prompt/src/.bin:~/Library/Python/3.6/bin/

export TERM=xterm-256color
PROMPT='%F{135}%n%f@%F{166}%m%f %F{118}%~%f $(git_super_status)$ '

