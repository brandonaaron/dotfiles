# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}

alias gs='git status'
alias gnb='git nb' # new branch aka checkout -b