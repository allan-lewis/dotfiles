# ~/.config/zsh/common.zsh
# Common interactive settings for all OSes.

# History settings (safe defaults)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Sensible completion and editing options (small starter set)
autoload -Uz compinit
compinit

setopt AUTO_CD
setopt CORRECT              # Mild command auto-correct
setopt NO_CASE_GLOB

# Prompt for now - we'll replace this with Starship later
PROMPT='%n@%m %1~ %# '
