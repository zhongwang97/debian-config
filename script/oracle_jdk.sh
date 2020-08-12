source $(dirname "$0")/utils.sh

checkNonSudo

read -p "specify JAVA_HOME " JAVA_HOME
if [[ ! -d $JAVA_HOME ]]; then
    echo "specified JAVA_HOME not exist"
    exit
fi

cat>>$HOME/.zshrc<<EOF

export JAVA_HOME=$JAVA_HOME
export JRE_HOME=\$JAVA_HOME/jre
export PATH=\$PATH:\$JAVA_HOME/bin
EOF