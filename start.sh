#!/bin/bash
# debugging
#java -Xmx1G -Xms1G -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar ./spigot.jar
cd ~/minecraft
java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot.jar

