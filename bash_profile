source ~/code/stack-kubernetes/bin/source/functions/set_workspace.sh
source ~/code/stack-kubernetes/bin/source/functions/start_kube_shell.sh
source ~/code/stack-kubernetes/bin/source/prompt/01-colors.sh
source ~/code/stack-kubernetes/bin/source/prompt/02-prompt.sh

alias l='ls -la'
alias add='git add'
alias commit='git commit'
alias push='git push'
alias pull='git pull'
alias vim=/usr/local/Cellar/vim/8.2.0/bin/vim
alias up='docker-compose up'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/Users/gnazeri/.pyenv/bin:/Users/gnazeri/.local/bin/:$PATH"
export LC_ALL=en_US.UTF-8

# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gb() {
  is_in_git_repo &&
    git branch -a | grep -v '/HEAD\s' | sed 's/^[ \t]*//;s/[ \t]*$//' |
    fzf --preview-window right:70% \
             --preview 'git show --color=always {}'
}

gt() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  # Pass the list of the tags to fzf-tmux
  # - "{}" in preview option is the placeholder for the highlighted entry
  # - Preview window can display ANSI colors, so we enable --color=always
  # - We can terminate `git show` once we have $LINES lines
  git tag --sort -version:refname |
    fzf-tmux --multi --preview-window right:70% \
             --preview 'git show --color=always {} | head -'$LINES
}

bind '"\er": redraw-current-line'
bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
bind '"\C-b": "$(gb)\e\C-e\er"'

