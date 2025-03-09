HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

export ANSIBLE_CONFIG=~/.config/ansible/ansible.cfg

alias castor='ssh ansible@192.168.86.125'
alias matrix='cmatrix -b'
alias nix-flake-rebuild='darwin-rebuild switch --flake ~/Developer/dotfiles/macos/nix-darwin'
alias pollux='ssh ansible@192.168.86.135'
alias rigel='ssh allan@192.168.86.104'
alias sz='source ~/.zshrc'

eval "$(starship init zsh)"

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
