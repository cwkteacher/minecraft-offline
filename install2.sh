#!/bin/bash
# debugging
#java -Xmx1G -Xms1G -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar ./spigot.jar
sudo test
echo "This will wipe any previous minecraft server installation including any student projects, continue?"
select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) exit;;
  esac
done
cd ~
rm -rf spigot
mkdir spigot
cd spigot
rm -f BuildTools.jar
rm -f spigot*.jar
curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar
java -jar BuildTools.jar
cd ~ && rm -rf minecraft

# install Linux specifics
if [[ `uname` == 'Linux' ]]; then
  sudo apt-get --assume-yes install git openjdk-8-jre-headless apt-transport-https
  cp ~/minecraft-offline/*.desktop ~/Desktop
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list  
  sudo apt-get --assume-yes update
  sudo apt-get --assume-yes install sublime-text
fi 

mkdir minecraft
cd ~/minecraft
mkdir plugins
cp ~/spigot/spigot* spigot.jar
cp ~/minecraft-offline/blocklycraft.jar plugins
#don't add js perms for all users for now
#cp ~/minecraft-offline/SCPerms.jar plugins
cp ~/minecraft-offline/eula.txt .
cp ~/minecraft-offline/server.properties .
cp ~/minecraft-offline/*.yml .
mkdir -p scriptcraft/modules
git clone https://github.com/cwkteacher/mo-cwk.git scriptcraft/modules/cwk
mkdir -p scriptcraft/plugins
killall java
~/minecraft-offline/start.sh
