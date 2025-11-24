# ~/.config/zsh/.zshrc

# Only run for interactive shells
[[ $- != *i* ]] && return

# Load common settings and helpers
if [[ -f "$ZDOTDIR/common.zsh" ]]; then
  source "$ZDOTDIR/common.zsh"
fi

# OS-specific config hook (Arch, Ubuntu, macOS)
if [[ "$OSTYPE" == darwin* ]]; then
  _os_file="$ZDOTDIR/os-macos.zsh"
elif [[ -f /etc/arch-release ]]; then
  _os_file="$ZDOTDIR/os-arch.zsh"
elif [[ -f /etc/lsb-release || -f /etc/debian_version ]]; then
  _os_file="$ZDOTDIR/os-ubuntu.zsh"
else
  _os_file=""
fi

if [[ -n "$_os_file" && -f "$_os_file" ]]; then
  source "$_os_file"
fi
unset _os_file

# Login-only hook: show fastfetch if installed
if [[ -o login ]] && [[ -f "$ZDOTDIR/login-fastfetch.zsh" ]]; then
  source "$ZDOTDIR/login-fastfetch.zsh"
fi

# Prompt: prefer Starship, fall back to a simple prompt if unavailable
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  # Simple fallback prompt if Starship isn't installed yet
  PROMPT='%n@%m %1~ %# '
fi
