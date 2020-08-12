read -p "Enter username [devbox]: " user
user=${user:-devbox}

read -p "Enter hostname [localhost]: " hostname
hostname=${hostname:-localhost}

read -p "Enter ssh port [8022]: " port
port=${port:-8022}

if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo "run after gen public key"
    echo 'ssh-keygen -t rsa -b 4096 -C "zhongwang97@gmail.com"'
    exit
fi
