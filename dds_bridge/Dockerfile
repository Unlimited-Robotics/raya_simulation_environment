FROM ros:melodic-ros-base

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    netcat \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -s /bin/bash -d /home/raya/ -m -G sudo raya
USER raya

WORKDIR /home/raya

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /home/raya/.bashrc && \
    echo '' >> /home/raya/.bashrc && \
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /home/raya/.bashrc

## DDS Bridge download
RUN mkdir -p /home/raya/ur && \
    cd /home/raya/ur/ && \
    wget https://github.com/Unlimited-Robotics/ur_dds_robot_bridge/releases/download/v0.5.0/bridge.tar.gz && \
    tar zxvf bridge.tar.gz

USER root
RUN cd /home/raya/ur/bridge/fast_dds && \
    cp -r ./local/ /usr/ && \
    cd /home/raya/ur/bridge && \
    rm -r ./fast_dds

# Launch Scripts    
COPY ./launch_bridge.sh /home/raya/
COPY ./test_ready.sh /home/raya/
RUN dos2unix /home/raya/launch_bridge.sh && \
    chmod +x /home/raya/launch_bridge.sh && \
    dos2unix /home/raya/test_ready.sh && \
    chmod +x /home/raya/test_ready.sh

USER raya

WORKDIR /home/raya

CMD ["bash", "/home/raya/launch_bridge.sh"]
