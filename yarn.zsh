# Yarn
alias yui='yarn upgrade-interactive'
alias ya='NPM_REGISTRY=https://registry.npmjs.org yarn npm audit --all --recursive'
alias yi='yarn install'
alias yd='yarn dev'
alias yb='yarn build'
alias p='column package.json'

# logs package version
pv() {
  node -p "require('./package.json').version"
}
