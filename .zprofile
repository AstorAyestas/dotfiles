# homebrew
export PATH="$PATH:/opt/homebrew/bin/"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Use Neovim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# needed for set up python version manager uv
export UV_TOOL_BIN_DIR="$HOME/.local/uv-tools/bin"
export PATH="$HOME/.local/uv-tools/bin:$PATH"

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

# fzf theme tokyonight night
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# setup bob nvim
source "/Users/astorayestas/.local/share/bob/env/env.sh"

# ripgrep config path
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
# npm global path
export PATH=~/.npm-global/bin:$PATH
# llm path
export LLM_USER_PATH="$HOME/.config/llm"
# opencode plan mode
export OPENCODE_EXPERIMENTAL_PLAN_MODE=0

export PATH="/opt/homebrew/opt/ffmpeg@7/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ffmpeg@7/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ffmpeg@7/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@7/lib/pkgconfig"

