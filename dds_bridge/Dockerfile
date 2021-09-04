FROM ros:melodic-ros-base

# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
RUN echo '' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc

# Install general dependencies
RUN apt-get update && apt-get install -y \
    git 

# DDS Bridge

RUN apt-get update && apt-get install -y python-pip tar
RUN pip install gdown

## FastDDS 2.3.0 Installation
RUN apt-get update && apt-get install -y build-essential libboost-all-dev libasio-dev avahi-utils
RUN mkdir -p /root/ur/deps
WORKDIR /root/ur/deps
RUN gdown https://drive.google.com/uc?id=1oNQId92JutwbqlHytrKJUFYQK-tkY5sM
RUN tar zxvf fast_dds_2.3.0_ubuntu18.04.tar.gz
RUN cp -r ./local/ /usr/
## Remove dependencies installation files
WORKDIR /root
RUN rm -rf /root/ur/deps/

## DDS Bridge download
WORKDIR /root/ur
RUN gdown https://drive.google.com/uc?id=1jDMSPifkLglZ8dTsuZLwCmJzI5Lios9W
RUN tar -xzvf bridge_v0.3.0.tar.gz
RUN mv bridge_v0.3.0 bridge
RUN rm *.tar.gz

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root/

CMD ["bash", "-c", "sleep 5 && /root/ur/bridge/dds_robot_bridge -c /root/ur/bridge/config/gary_unity.json"]
