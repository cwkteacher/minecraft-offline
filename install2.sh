#!/bin/bash
# debugging
#java -Xmx1G -Xms1G -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar ./spigot.jar
cd ~
rm -rf spigot
mkdir spigot
cd spigot
rm BuildTools.jar
rm spigot*.jar
curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar
java -jar BuildTools.jar
cd ~ && rm -rf minecraft

# install desktop icons on Linux
if [[ `uname` == 'Linux' ]]; then
  cp ~/minecraft-offline/*.desktop ~/Desktop
fi

mkdir minecraft
cd ~/minecraft
mkdir plugins
cp ~/spigot/spigot* spigot.jar
cp ~/minecraft-offline/blocklycraft.jar plugins
cp ~/minecraft-offline/SCPerms.jar plugins
cp ~/minecraft-offline/eula.txt .
cp ~/minecraft-offline/server.properties .
cp ~/minecraft-offline/*.yml .
mkdir -p scriptcraft/modules
git clone https://github.com/cwkteacher/mo-cwk.git scriptcraft/modules/cwk
mkdir -p scriptcraft/plugins
killall java
~/minecraft-offline/start.sh
