# homebrew
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Use Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# needed for set up python version manager nvm
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# needed for set up node version manager nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# set up the path for the scripts that are in dotfiles/.local/bin/
export PATH="$HOME/.local/bin/:$PATH"

# set up config directory for lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# kanagawa Colors
export FUJIWHITE="#DCD7BA" # Default foreground
export CRYSTALBLUE="#7E9CD8" # Functions and Titles
export WAVEBLUE1="#223249" # Popup background, visual selection background
export WINTERBLUE="#252535" # Diff Line (background)

# Gum Customization

# gum input
export GUM_INPUT_CURSOR_FOREGROUND=$FUJIWHITE

# gum choose
export GUM_CHOOSE_HEADER_FOREGROUND=$CRYSTALBLUE
export GUM_CHOOSE_ITEM_FOREGROUND=$CRYSTALBLUE
export GUM_CHOOSE_SELECTED_FOREGROUND=$FUJIWHITE

# gum filter
export GUM_FILTER_CURSOR_TEXT_FOREGROUND=$FUJIWHITE
export GUM_FILTER_HEADER_FOREGROUND=$FUJIWHITE
export GUM_FILTER_MATCH_FOREGROUND=$CRYSTALBLUE
export GUM_FILTER_PROMPT_FOREGROUND=$FUJIWHITE
export GUM_FILTER_PLACEHOLDER_FOREGROUND=$FUJIWHITE

# gum write
export GUM_WRITE_CURSOR_FOREGROUND=$FUJIWHITE

# gum confirm
export GUM_CONFIRM_PROMPT_FOREGROUND=$CRYSTALBLUE
export GUM_CONFIRM_SELECTED_BACKGROUND=$WINTERBLUE
export GUM_CONFIRM_UNSELECTED_BACKGROUND=$WAVEBLUE1

# gum spin
export GUM_SPIN_SPINNER_FOREGROUND=$CRYSTALBLUE

# Golang environment variables
export GOROOT=$(brew --prefix go)/libexec
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

# fzf theme rose pine
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# ripgrep config path
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
# npm global path
export PATH=~/.npm-global/bin:$PATH
