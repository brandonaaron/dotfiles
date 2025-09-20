# Don't try to glob with zsh so you can do
# stuff like ga *foo* and correctly have
# git add the right stuff
alias git='noglob git'

# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

alias gs='git status'
alias gnb='git nb' # new branch aka checkout -b
alias gaa='git add --all'
alias gc='git commit --verbose'
alias gd='git diff'
