#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

source /opt/ros/melodic/setup.bash
source ~/raya_unity_ws/devel/setup.bash

IP_ADDR=$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{print $2}')
echo "ROS_IP: \"$IP_ADDR\"" > /root/raya_unity_ws/src/raya_simulation_unity/config/params.yaml

/root/test_ready.sh &
roslaunch raya_simulation_unity unity_all.launch 2>&1 | tee /root/connlog.log
