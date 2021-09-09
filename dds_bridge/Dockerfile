FROM ros:melodic-ros-base

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
RUN echo '' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget

## DDS Bridge download
RUN mkdir -p /root/ur
WORKDIR /root/ur/
RUN wget https://github.com/Unlimited-Robotics/ur_dds_robot_bridge/releases/download/v0.4.2/bridge.tar.gz
RUN tar zxvf bridge.tar.gz
WORKDIR /root/ur/bridge/fast_dds
RUN cp -r ./local/ /usr/
WORKDIR /root/ur/bridge
RUN rm -r ./fast_dds

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD ["bash", "-c", "/root/ur/bridge/dds_robot_bridge -c /root/ur/bridge/config/gary_unity.json"]
