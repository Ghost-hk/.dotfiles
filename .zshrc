# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


#aliases
alias n='nvim'
alias t='tmux'
alias screen='xrandr --output HDMI-A-0 --auto --primary --output eDP --off'

ZSH_THEME="robbyrussell"

plugins=(
git
zsh-autosuggestions
sudo
web-search
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config ~/.poshthemes/catppuccin_frappe.omp.json)"

export PATH="$PATH:$HOME/.yarn/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
