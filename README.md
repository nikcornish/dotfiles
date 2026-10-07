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

A `~/.zshrc` file sources all .zsh files in the project directory. 

On MacOS, clone the repo to your home directory `~/` so it will sit alongside the `.zshrc` file you create in Step 2.

## Setting up on a new machine

### 1. Clone repo to home directory:

```bash
cd ~/
git clone https://github.com/nikcornish/dotfiles.git
```

### 2. Set up `~/.zshrc`

```zsh
# Source all zsh config files
for file in ~/.dotfiles/*.zsh; do
  source "$file"
done
```
