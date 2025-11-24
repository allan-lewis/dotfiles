# ~/.config/zsh/common.zsh
# Common interactive settings for all OSes.

# History settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit
compinit

# Useful options
setopt AUTO_CD
setopt CORRECT              # mild command auto-correct
setopt NO_CASE_GLOB

# (Prompt handled in .zshrc via Starship or fallback)
