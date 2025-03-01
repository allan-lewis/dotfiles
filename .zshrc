HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

alias matrix='cmatrix -b'
alias nix-flake-rebuild='darwin-rebuild switch --flake ~/dotfiles/.config/nix-darwin'

# source /run/current-system/sw/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
