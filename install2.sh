#!/bin/bash
# debugging
#java -Xmx1G -Xms1G -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar ./spigot.jar
# move this all to git and do a git pull here to update itself
cd /home/student
rm -rf spigot
mkdir spigot
cd spigot
rm BuildTools.jar
rm spigot*.jar
curl "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" -o BuildTools.jar
java -jar BuildTools.jar
cd /home/student && rm -rf minecraft
mkdir minecraft
cd /home/student/minecraft
mkdir plugins
cp /home/student/spigot/spigot* spigot.jar
cp /home/student/minecraft-offline/*.desktop /home/student/Desktop
cp /home/student/minecraft-offline/blocklycraft.jar /home/student/minecraft/plugins
cp /home/student/minecraft-offline/eula.txt /home/student/minecraft/
cp /home/student/minecraft-offline/server.properties /home/student/minecraft/
killall java
/home/student/minecraft-offline/start.sh
