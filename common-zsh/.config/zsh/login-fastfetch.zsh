# ~/.config/zsh/login-fastfetch.zsh

# Run only if fastfetch exists
if command -v fastfetch >/dev/null 2>&1; then
  # Clear the screen, but ONLY for real terminals
  # (avoids messing with cron, scp, etc.)
  if [[ -t 1 ]]; then
    clear
  fi

  fastfetch
fi
