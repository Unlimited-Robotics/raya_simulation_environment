FROM ros:melodic-ros-base

WORKDIR /root

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc && \
    echo '' >> /root/.bashrc && \
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \    
    net-tools \
    dos2unix \
    netcat

# ROS Packages
RUN apt-get update && apt-get install -y \
        ros-melodic-rqt-robot-steering \
        ros-melodic-rviz \
        ros-melodic-compressed-image-transport \
        ros-melodic-navigation \
        ros-melodic-teb-local-planner \
        ros-melodic-joint-state-publisher \
        ros-melodic-joint-state-publisher-gui \
        ros-melodic-robot-state-publisher \
        ros-melodic-kdl-parser-py && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    git clone --branch v0.6 --depth 1 --recurse-submodules https://github.com/Unlimited-Robotics/raya_unity_ws && \
    cd /root/raya_unity_ws/ && \
    /bin/bash -c " \
        source /opt/ros/melodic/setup.bash && \
        rosdep update && \
        rosdep install --from-paths src --ignore-src -r -y && \
        catkin_make --only-pkg-with-deps raya_msgs && \
        catkin_make -DCATKIN_WHITELIST_PACKAGES='' " && \
    echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc && \
    echo 'source ~/raya_unity_ws/devel/setup.bash' >> /root/.bashrc && \
    rm -rf /var/lib/apt/lists/*

# RUN git clone --branch v0.6 --depth 1 --recurse-submodules https://github.com/Unlimited-Robotics/raya_unity_ws
# WORKDIR /root/raya_unity_ws/
# RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && rosdep update"
# RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && rosdep install --from-paths src --ignore-src -r -y"
# RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make --only-pkg-with-deps raya_msgs"
# RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make -DCATKIN_WHITELIST_PACKAGES=''"
# RUN echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc
# RUN echo 'source ~/raya_unity_ws/devel/setup.bash' >> /root/.bashrc
# RUN rm -rf /var/lib/apt/lists/*

# Launch Scripts    
COPY ./launch_connection.sh /root/
COPY ./test_ready.sh /root/

RUN dos2unix /root/launch_connection.sh \
    && chmod +x /root/launch_connection.sh \
    && dos2unix /root/test_ready.sh \
    && chmod +x /root/test_ready.sh

# RUN touch foo.txt
# CMD ["tail", "-F", "foo.txt"]

CMD ["/bin/bash", "/root/launch_connection.sh"]
