#!/bin/bash

while ! nc -z localhost 8880;
do
    echo "Waiting for ROS Workspace...";
    sleep 3.0;
done;

echo "ROS Workspace ready!";

/home/raya/test_ready.sh &
/home/raya/ur/bridge/dds_robot_bridge -c /home/raya/ur/bridge/config/gary_unity.json 2>&1 | tee /home/raya/bridgelog.log
