HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

export ANSIBLE_CONFIG=~/.config/ansible/ansible.cfg
export TERM=xterm-256color


# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
