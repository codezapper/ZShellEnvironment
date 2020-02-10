# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#prompt skwp

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
alias vim=/usr/local/Cellar/vim/8.2.0/bin/vim

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

function chpwd() {
	if [ -f venv/bin/activate ]; then
		. venv/bin/activate
	fi
}

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

export PATH="/Users/gnazeri/.pyenv/bin:/Users/gnazeri/.local/bin/:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export LC_ALL=en_US.UTF-8

export CPPFLAGS=-I/usr/local/Cellar/mysql-client@5.7/5.7.28/include/mysql/


if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY_TIME   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

