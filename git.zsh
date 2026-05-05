# Git Aliases
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias gremote='git branch -v -a' # follow with git switch branchname to checkout locally
alias gll='git log -p -n 1' # shows changes in last commit
alias gcm='git commit -m'
alias ga='git add .'
alias gu='git up'
alias gc='git checkout'
alias gp='git push'
alias gpf='git push --force'
alias gswitch='git checkout -' # checkout previous branch
alias gr='git restore -- .' # reverts all changes in working directory

function gl() {
  git log --oneline --max-count=${1:-10}
}

# searches HEAD (current branch) commit msgs for a string, e.g. is EB-1234 found in HEAD
gsearch() {
    local result=$(git log HEAD --grep="$1" --oneline --date=relative --pretty=format:"%h - %ar: %s")
    if [ -z "$result" ]; then
        echo "Not found"
    else
        echo "----------"
        echo "Yes, branch is merged (or at least string was found in HEAD via grep 🤷)"
        echo "$result"
        echo "----------"
    fi
}
