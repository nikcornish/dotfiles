# dotfiles

Personal zsh configuration files, safe to commit and reuse across machines.

## What's in here

| File | Description |
|---|---|
| `aliases.zsh` | General shortcuts (`c`, `l`, `z`, `z!`, `hosts`, `cc`) |
| `git.zsh` | Git aliases and helper functions (`gl`, `gsearch`) |
| `yarn.zsh` | Yarn aliases and `pv` (print package version) |
| `functions.zsh` | General utility functions (`findPath`) |
| `prompt.zsh` | Terminal prompt with git branch name |

## What's NOT in here (local only)

These files live in `~/.zsh/` on each machine but are never committed:

| File | Description |
|---|---|
| `tools.zsh` | NVM, pnpm, mise, Java, Docker, Python PATH setup |
| `bosch.zsh` | Work-specific aliases, navigation, build scripts |
| `apiKeys.zsh` | API keys and secrets — never commit this |

## How it works

`~/.zshrc` sources everything in `~/.zsh/*.zsh` via a glob:

```zsh
for file in ~/.zsh/*.zsh; do
  source "$file"
done
```

The files in this repo are **symlinked** into `~/.zsh/`, so zsh loads them as normal but the source of truth is this git repo.

## Setting up on a new machine

### 1. Clone this repo

```bash
git clone <repo-url> ~/Documents/Side\ Projects/dotfiles
```

### 2. Create the `~/.zsh/` directory

```bash
mkdir -p ~/.zsh
```

### 3. Symlink each file into `~/.zsh/`

```bash
ln -s ~/Documents/Side\ Projects/dotfiles/aliases.zsh ~/.zsh/aliases.zsh
ln -s ~/Documents/Side\ Projects/dotfiles/git.zsh ~/.zsh/git.zsh
ln -s ~/Documents/Side\ Projects/dotfiles/yarn.zsh ~/.zsh/yarn.zsh
ln -s ~/Documents/Side\ Projects/dotfiles/functions.zsh ~/.zsh/functions.zsh
ln -s ~/Documents/Side\ Projects/dotfiles/prompt.zsh ~/.zsh/prompt.zsh
```

### 4. Create local-only files manually

Create `~/.zsh/tools.zsh`, `~/.zsh/bosch.zsh`, and `~/.zsh/apiKeys.zsh` for machine-specific config and secrets.

### 5. Adding a new dotfile in future

1. Create the file in `~/Documents/Side Projects/dotfiles/your-file.zsh`
2. Symlink it: `ln -s ~/Documents/Side\ Projects/dotfiles/your-file.zsh ~/.zsh/your-file.zsh`
3. Reload: `source ~/.zshrc` (or `z!`)
4. Commit and push

### 6. Set up `~/.zshrc`

```zsh
# Source all zsh config files
for file in ~/.zsh/*.zsh; do
  source "$file"
done

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```
