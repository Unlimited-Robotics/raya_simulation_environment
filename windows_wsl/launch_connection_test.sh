#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

source /opt/ros/melodic/setup.bash
source ~/raya_unity_ws/devel/setup.bash

/root/ur/bridge/dds_robot_bridge_test -c /root/ur/bridge/config/gary_unity.json
