HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

alias matrix='cmatrix -b'
alias nix-flake-rebuild='darwin-rebuild switch --flake ~/.config/nix-darwin'

eval "$(starship init zsh)"
