source $(dirname "$0")/utils.sh

read -p "Please ensure oh-my-zsh installed: [yn] " yn
if [[ ${yn} != "y" ]]; then
    echo "install oh-my-zsh first"
    exit
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

zshrc="$HOME/.zshrc"

backup ${zshrc}
cat>${zshrc}<<EOF
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git colored-man-pages autojump zsh-syntax-highlighting fzf fancy-ctrl-z docker docker-compose)

source $ZSH/oh-my-zsh.sh

#screenfetch
EOF

hint "setup docker"
