echo ==============================
echo update ubuntu package 
echo ============================== 
apt-get update && \
apt-get install software-properties-common -y && \
apt-get install wget -y

echo ==============================
echo install jdk
echo ==============================
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
apt-get install oracle-java8-set-default

echo ==============================
echo install maven
echo ==============================
cd /opt/ && wget https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
mv apache-maven-3.3.9 maven

echo ================================
echo Adicionado variável de ambiente
echo ================================
export M2_HOME=/opt/maven
echo "export M2_HOME=/opt/maven" > /etc/profile.d/mavenenv.sh && \
echo "export PATH="\$M2_HOME"/bin:\$PATH" >> /etc/profile.d/mavenenv.sh && \
chmod +x /etc/profile.d/mavenenv.sh
source /etc/profile.d/mavenenv.sh

echo ==============================
echo install git
echo ==============================
apt-get install -y git

echo ==============================
echo config git
echo ==============================
echo git name, example: Lord Voldemort
read gitName
git config --global user.name $gitName  && \
echo git email, example: lord.voldemort@fluig.com
read gitEmail
git config --global user.email $gitEmail  && \
git config --global core.precomposeunicode true  && \
git config --list

echo ==============================
echo git ssh key
echo ==============================
ssh-keygen -t rsa -C $gitEmail

echo ==============================
echo install docker
echo ==============================
apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
apt-key fingerprint 0EBFCD88 && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable" && \
apt-get update && \
apt-get install -y docker-ce

echo ==============================
echo add docker root
echo ==============================
groupadd docker && \
usermod -aG docker $USER

echo ==============================
echo install docker-compose
echo ==============================
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose

echo ==============================
echo install node
echo ==============================
apt-get install -y nodejs

echo ==============================
echo install npm
echo ==============================
apt-get install -y npm

echo ==============================
echo install google chrome
echo ==============================
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list
apt update
apt install -y google-chrome-stable

echo install teamviewer
echo ==============================
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb

echo ==============================
echo Done, restart your machine!
echo ==============================

echo
echo ==============================
echo https://www.omgubuntu.co.uk/2018/04/things-to-do-after-installing-ubuntu-18-04
echo ==============================
