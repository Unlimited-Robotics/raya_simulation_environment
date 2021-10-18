FROM ros:melodic-ros-base

WORKDIR /root

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc && \
    echo '' >> /root/.bashrc && \
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    netcat \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*



## DDS Bridge download
RUN mkdir -p /root/ur && \
    cd /root/ur/ && \
    wget https://github.com/Unlimited-Robotics/ur_dds_robot_bridge/releases/download/v0.5.0/bridge.tar.gz && \
    tar zxvf bridge.tar.gz && \
    cd /root/ur/bridge/fast_dds && \
    cp -r ./local/ /usr/ && \
    cd /root/ur/bridge && \
    rm -r ./fast_dds

# Launch Scripts    
COPY ./launch_bridge.sh /root/
COPY ./test_ready.sh /root/
RUN dos2unix /root/launch_bridge.sh && \
    chmod +x /root/launch_bridge.sh && \
    dos2unix /root/test_ready.sh && \
    chmod +x /root/test_ready.sh

WORKDIR /root

CMD ["bash", "/root/launch_bridge.sh"]
