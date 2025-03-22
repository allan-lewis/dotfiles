# Append to history file immediately instead of overwriting it
setopt appendhistory

# Share command history across all active sessions in real-time
setopt sharehistory

# Ignore duplicate commands in the history
setopt histignoredups

# Ignore commands that start with a space (useful for sensitive commands)
setopt histignorespace

# Prevent adding empty lines to history
setopt histignorealldups

# Save multiple lines as a single command (useful for long, multiline commands)
setopt incappendhistory

# Allow the use of timestamps in history
setopt extended_history

# Set the size of the history file
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

export PATH=$PATH:$(go env GOPATH)/bin

export ANSIBLE_CONFIG=~/.config/ansible/ansible.cfg

alias castor='ssh lab@192.168.86.125'
alias matrix='cmatrix -b'
alias nix-flake-rebuild='darwin-rebuild switch --flake ~/Developer/dotfiles/macos/nix-darwin'
alias pollux='ssh lab@192.168.86.135'
alias rigel='ssh allan@192.168.86.104'
alias sz='source ~/.zshrc'

eval "$(starship init zsh)"

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
