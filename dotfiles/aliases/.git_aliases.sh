# Git Aliases

# g_ Aliases

alias g='git'
alias gi='git init'
alias ga='git add .'
alias gap='git add --all -p'
alias gc='git commit -m'
alias gac='git add . && git commit -m'
alias gapc='git add --all -p && git commit -m'
alias gb='git branch'
alias gco="git checkout"
alias gs='git status'
alias gss='git status -s'
alias gd='git diff'
alias gdc='git diff --cached'
alias ggph='git push origin HEAD && gobranch'
alias gph='git push origin HEAD'
alias gr='git pull --rebase'
alias gv='git remote -v'

# Shorthands

alias choochoo='git push origin master --force'
alias hitme='git pull origin master'
alias mikedrop='git push origin master'

git-help () {
  echo " Git Aliases"
  echo
  echo " g_ Aliases"
  echo
  echo " g   = git"
  echo " gi  = git init"
  echo " ga  = git add ."
  echo " gap = git add --all -p"
  echo " gc  = git commit -m"
  echo " gac = git add . && git commit -m"
  echo " gapc= git add --all -p && git commit -m"
  echo " gb  = git branch"
  echo " gco = git checkout"
  echo " gs  = git status"
  echo " gss = git status -s"
  echo " gd  = git diff"
  echo " gdc = git diff --cached"
  echo " gph = git push origin HEAD"
  echo " ggph = git push origin HEAD && gobranch"
  echo " gr  = git pull --rebase"
  echo " gv  = git remote -v"
  echo
  echo " Shorthands"
  echo
  echo " mikedrop = git push origin master"
  echo " choochoo = git push origin master --force"
  echo " hitme    = git pull origin master"
  echo
}