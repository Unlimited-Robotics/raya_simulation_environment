FROM ros:melodic-ros-base

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
RUN echo '' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \    
    net-tools \
    dos2unix

# ROS Packages
RUN apt-get update && apt-get install -y \
    ros-melodic-rqt-robot-steering \
    ros-melodic-rviz \
    ros-melodic-compressed-image-transport \
    ros-melodic-navigation \
    ros-melodic-teb-local-planner \
    ros-melodic-joint-state-publisher \
    ros-melodic-joint-state-publisher-gui \
    ros-melodic-robot-state-publisher
    
WORKDIR /root
RUN git clone --branch v0.5 --depth 1 --recurse-submodules https://github.com/Unlimited-Robotics/raya_unity_ws
WORKDIR /root/raya_unity_ws/
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && rosdep update"
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && rosdep install --from-paths src --ignore-src -r -y"
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"
RUN echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc
RUN echo 'source ~/raya_unity_ws/devel/setup.bash' >> /root/.bashrc

RUN rm -rf /var/lib/apt/lists/*

# Launch Scripts    
COPY ./launch_connection.sh /root/
RUN dos2unix /root/launch_connection.sh
RUN chmod +x /root/launch_connection.sh

WORKDIR /root

CMD ["/bin/bash", "/root/launch_connection.sh"]
