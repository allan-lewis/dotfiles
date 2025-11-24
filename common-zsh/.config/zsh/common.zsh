# ~/.config/zsh/common.zsh
# Common interactive settings for all OSes.

# Work around hosts that don't know Ghostty's TERM
if [[ "$TERM" = "xterm-ghostty" ]]; then
  # If this TERM isn't known here, fall back to xterm-256color
  if ! infocmp >/dev/null 2>&1; then
    export TERM="xterm-256color"
  fi
fi

# Load terminfo and fix keybindings for backspace/delete, etc.
if [[ -o interactive ]]; then
  zmodload zsh/terminfo 2>/dev/null || true

  # Backspace
  if [[ -n "${terminfo[kbs]}" ]]; then
    bindkey "${terminfo[kbs]}" backward-delete-char
  else
    # Fallback: most terminals send ^?
    bindkey '^?' backward-delete-char
  fi

  # Delete
  if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey "${terminfo[kdch1]}" delete-char
  fi

  # Home/End (nice to have)
  if [[ -n "${terminfo[khome]}" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
  fi
  if [[ -n "${terminfo[kend]}" ]]; then
    bindkey "${terminfo[kend]}" end-of-line
  fi

# Align the TTY erase character with what most modern terminals send (^?)
if [[ -t 0 ]]; then
  stty erase '^?' 2>/dev/null || true
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
