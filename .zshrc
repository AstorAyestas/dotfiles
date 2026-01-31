# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# ssh-agent
zinit snippet OMZP::ssh-agent/ssh-agent.plugin.zsh

# Load completions
autoload -Uz compinit && compinit

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/minimal.toml)"
fi

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# vim mode
bindkey -v

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# -------------------------------------------
# chpwd Hook - Run Commands on Directory Change
# -------------------------------------------
# NOTE: Only one chpwd hook can be defined at once
#

# Auto-use correct Node version with nvm
chpwd() {
  if [[ -f .nvmrc ]]; then
    nvm use
  fi
}

# setup ssh-key to use the keychain
zstyle :omz:plugins:ssh-agent ssh-add-args --apple-load-keychain

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# rbenv
eval "$(rbenv init -)"

# Aliases
[ -f "$HOME/.aliases.zsh" ] && source "$HOME/.aliases.zsh"

# Work
[ -f "$HOME/.work.zsh" ] && source "$HOME/.work.zsh"

# Personal
[ -f "$HOME/.personal.zsh" ] && source "$HOME/.personal.zsh"

