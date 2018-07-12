#!/bin/bash
# debugging
#java -Xmx1G -Xms1G -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar ./spigot.jar
cd ~/minecraft
java -jar BuildTools.jar
cd ~/minecraft/scriptcraft/modules/cwk
git pull
cd ~/minecraft/scriptcraft/plugins/mo-cwkteacher
git pull
cd ~
bash
