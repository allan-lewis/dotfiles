# ~/.config/zsh/common.zsh
# Common interactive settings for all OSes.

# Fix TERM when using Ghostty on hosts without xterm-ghostty terminfo
if [[ "$TERM" = "xterm-ghostty" ]]; then
  # If this terminal type isn't known here, fall back to a common one
  if ! infocmp >/dev/null 2>&1; then
    export TERM="xterm-256color"
  fi
fi

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
