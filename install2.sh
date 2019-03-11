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
#check and install latest version of curl just in case
sudo apt-get install curl
rm -rf spigot
mkdir spigot
cd spigot
rm -f BuildTools.jar
rm -f spigot*.jar
curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar
java -Xmx1G -jar BuildTools.jar --rev 1.12.2
cd ~ && rm -rf minecraft

# install Linux specifics (Desktop Icons for kids)
if [[ `uname` == 'Linux' ]]; then
	if [ -x "$(command -v xfce4-terminal)" ]; then
		echo "installing desktop icons for XFCE environment"
		cp ~/minecraft-offline/*.desktop ~/Desktop
	fi
	if [ -x "$(command -v mate-terminal)" ]; then
		echo "installing desktop icons for XFCE environment"
		cp ~/minecraft-offline/MATE-Desktop/*.desktop ~/Desktop
	fi
fi 

mkdir minecraft
cd ~/minecraft
mkdir plugins
cp ~/spigot/spigot* spigot.jar
cp ~/minecraft-offline/blocklycraft.jar plugins
cp ~/minecraft-offline/cwkutils.jar plugins
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
