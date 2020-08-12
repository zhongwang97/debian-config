source $(dirname "$0")/utils.sh

checkNonSudo

read -p "first install jdk, confirm? [yn] " yn
if [[ ${yn}  != "y" ]]; then
    exit
fi

read -p "M3_HOME: " m3_home
if [[ -d m3_home ]]; then
    echo "M3_HOME exist"
    exit
fi

read -p "maven version: [3.6.3] " mvnVersion
mvnVersion=${mvnVersion:-3.6.3}

wget https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${mvnVersion}/binaries/apache-maven-${mvnVersion}-bin.tar.gz
tar -xzvf apache-maven-${mvnVersion}-bin.tar.gz

sudo mkdir -p ${m3_home}
sudo mv apache-maven-${mvnVersion}/* ${m3_home}

cat>>${HOME}/.zshrc<<EOF
export M3_HOME=${m3_home}
export PATH=\${M3_HOME}/bin:\$PATH
EOF

mkdir -p ${HOME}/.m2
cp ${m3_home}/conf/settings.xml ${HOME}/.m2/settings.xml

cat>${HOME}/.m2/settings.xml<<EOF
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <pluginGroups></pluginGroups>
  <proxies></proxies>
  <servers></servers>
  <mirrors>
    <mirror>
      <id>alimaven</id>
      <mirrorOf>central</mirrorOf>
      <name>aliyun maven</name>
      <url>https://maven.aliyun.com/repository/public/</url>
    </mirror>
    <mirror>
      <id>jboss-public-repository-group</id>
      <mirrorOf>central</mirrorOf>
      <name>JBoss Public Repository Group</name>
      <url>http://repository.jboss.org/nexus/content/groups/public</url>
    </mirror>
  </mirrors>
  <profiles></profiles>
</settings>
EOF

rm apache-maven-${mvnVersion}-bin.tar.gz
rm -rf apache-maven-${mvnVersion}
