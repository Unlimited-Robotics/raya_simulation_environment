#!/bin/bash

while ! nc -z ros_ws 8880;
do
    echo "Waiting for ROS Workspace...";
    sleep 3.0;
done;

echo "ROS Workspace ready!";

/root/test_ready.sh &
/root/ur/bridge/dds_robot_bridge -c /root/ur/bridge/config/gary_unity.json 2>&1 | tee /root/bridgelog.log
