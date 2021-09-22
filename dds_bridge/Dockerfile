FROM ros:melodic-ros-base

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
RUN echo '' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    netcat \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

## DDS Bridge download
RUN mkdir -p /root/ur
WORKDIR /root/ur/
RUN wget https://github.com/Unlimited-Robotics/ur_dds_robot_bridge/releases/download/v0.4.6/bridge.tar.gz
RUN tar zxvf bridge.tar.gz
WORKDIR /root/ur/bridge/fast_dds
RUN cp -r ./local/ /usr/
WORKDIR /root/ur/bridge
RUN rm -r ./fast_dds

# Launch Scripts    
COPY ./launch_bridge.sh /root/
RUN dos2unix /root/launch_bridge.sh
RUN chmod +x /root/launch_bridge.sh

# Launch Scripts    
COPY ./test_ready.sh /root/
RUN dos2unix /root/test_ready.sh
RUN chmod +x /root/test_ready.sh

WORKDIR /root

CMD ["bash", "/root/launch_bridge.sh"]
