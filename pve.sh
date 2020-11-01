source $(dirname "$0")/base.sh

ssh-copy-id ${user}@${hostname} -p ${port}
ssh -t -t ${user}@${hostname} -p ${port} /bin/bash -c 'uname -a; \
    apt install sudo apt-transport-https vim git curl zsh'

read -p "enter Host [devbox-0]: " host
host=${host:-devbox-0}

cat<<EOF
Host ${host}
    HostName ${hostname}
    Port ${port}
    User ${user}
    Identityfile ~/.ssh/id_rsa
EOF