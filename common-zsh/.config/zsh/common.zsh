# ~/.config/zsh/common.zsh
# Minimal, known-good base config while we debug

print -u2 "[DEBUG] common.zsh loaded (user=$USER, ZDOTDIR=$ZDOTDIR, HISTFILE=$HISTFILE)"

########## HISTORY ##########

# Where to store history
export HISTFILE="$HOME/.zsh_history"

# How many lines to keep
HISTSIZE=10000
SAVEHIST=10000

# Make sure history is written and shared across sessions
setopt APPEND_HISTORY          # write history on exit
setopt SHARE_HISTORY           # read from HISTFILE in new shells

# Sensible filters
setopt HIST_IGNORE_DUPS        # ignore immediate duplicates
setopt HIST_IGNORE_SPACE       # ignore commands starting with a space
setopt HIST_REDUCE_BLANKS      # trim extra spaces

########## COMPLETION ##########

autoload -Uz compinit
compinit

########## GHOSTTY / TERM FIX ##########

if [[ "$TERM" = "xterm-ghostty" ]]; then
  if ! infocmp >/dev/null 2>&1; then
    export TERM="xterm-256color"
  fi
fi

########## KEYBINDINGS / BACKSPACE ##########

if [[ -o interactive ]]; then
  zmodload zsh/terminfo 2>/dev/null || true

  # Backspace
  if [[ -n "${terminfo[kbs]}" ]]; then
    bindkey "${terminfo[kbs]}" backward-delete-char
  else
    bindkey '^?' backward-delete-char
  fi

  # Delete
  if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey "${terminfo[kdch1]}" delete-char
  fi

  # Home / End
  if [[ -n "${terminfo[khome]}" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line
  fi
  if [[ -n "${terminfo[kend]}" ]]; then
    bindkey "${terminfo[kend]}" end-of-line
  fi

  # TTY erase char
  if [[ -t 0 ]]; then
    stty erase '^?' 2>/dev/null || true
  fi
fi

########## AUTOSUGGESTIONS ##########

# zsh-autosuggestions plugin (fish-like history suggestions)
if [[ -d "$ZDOTDIR/plugins/zsh-autosuggestions" ]]; then
  source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

  # Optional: tweak the suggestion style to fit Catppuccin vibe
  # (default is a faint grey; this makes it a bit more visible)
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'  # surface2-ish
fi

########## SYNTAX HIGHLIGHTING ##########

if [[ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
