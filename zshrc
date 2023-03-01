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
alias vi=/usr/bin/vim

bindkey -s "[24~" "git push
"
bindkey -s "[20~" "git status
"
bindkey -s "[15~" "git pull
"

export TERM=xterm-256color

autoload -U colors && colors
autoload -U history-search-end
autoload -U zmv

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "OA" history-beginning-search-backward-end
bindkey "OB" history-beginning-search-forward-end

setopt PROMPT_SUBST
setopt INTERACTIVE_COMMENTS

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

function git_branch() {
  BRANCH=`git branch 2> /dev/null |sed -e '/^[^*]/d' | sed -e 's/*\s\(.*\)/(\1)/' | sed -e 's/remotes\///g'`
  echo $BRANCH
}

export PS1=$'%{$fg[cyan]%}%n@%m%{$reset_color%} %~ %{$fg[green]%}$(git_branch)%{$reset_color%}$ '
export PATH=$PATH:/usr/local/bin/:~/code/FakeFuzzyFinder

source ~/code/FakeFuzzyFinder/shell/zsh_key_bindings.zsh

