export ZSH="/Users/alexrussellsaw/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_HIDE_BRANCH_ICON=true
POWERLEVEL9K_VCS_SHORTEN_LENGTH=6
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=6
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_SHORTEN_DELIMITER=""

# aliases and utility funcs

function repo() {
	git remote -v |grep origin |head -n 1 |awk '{ print $2 }' | sed 's/https\:\/\/github.com//g' |sed 's/\.git//g'
}

alias opr='open https://github.com$(repo)/pull/new/$(git branch | grep \* | cut -d " " -f2)'


function csv() {
	column -s="," -t $1 | less -S
}

function tsv() {
	column -s="\t" -t $1 | less -S
}

function pods() {
	kubectl get pods -n io-gmon -l app=io.gmon.$1
}

function watchpods() {
	kubectl get pods -n io-gmon -l app=io.gmon.$1 --watch
}

function tailf() ( # args: <file> [<number-of-header-lines>]
  trap 'tput csr 0 "$((LINES-1))"' INT
  tput csr "$((1+${2-1}))" "$((LINES-1))"
  tput clear
  {
    head -n"${2-1}"
    printf "%${COLUMNS}s\n" "" | tr ' ' =
    tail -n "$((LINES-1-${2-1}))" -f
  } < "$1"
)

function fag(){
  local line
  line=`ag --nocolor "$1" | fzf` \
    && vim $(cut -d':' -f1 <<< "$line") +$(cut -d':' -f2 <<< "$line")
}

alias gl='git log --pretty=format:"%Cblue%h %Cgreen%an %Creset%s" --graph --no-merges'
alias gb='git for-each-ref --sort=committerdate refs/heads/ --format="%(color:yellow) %(committerdate) %(color:green) %09 %(refname:short) %(color:white) %09 %(authorname)"'
alias vim='nvim'
alias cls='clear'
alias ls='ls -G'
alias wea='cd $HOME/src/github.com/monzo/wearedev'
alias ana='cd $HOME/src/github.com/monzo/analytics'
alias dkubectl='kubectl --kubeconfig=/Users/alexrussellsaw/.kube/dok8s.yaml'
alias tsh='ssh-agent tsh'
alias fzf='fzf --preview="bat --color=always {}"'
alias vf='vim $(fzf --preview="bat --color=always {}")'

export EDITOR=/usr/local/bin/nvim
export PATH=$PATH:~/.cargo/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexrussellsaw/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alexrussellsaw/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexrussellsaw/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alexrussellsaw/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
