FROM ros:melodic-ros-base


# First .bashrc mods
RUN sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
RUN echo '' >> /root/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc


# Install general dependencies
RUN apt-get update
RUN apt-get install --assume-yes nano lsb-release git dos2unix xterm openssh-client wget tar net-tools
RUN apt-get install --assume-yes python-pip
RUN pip install gdown

# DDS Bridge

## FastDDS 2.3.0 Installation
RUN apt-get install --assume-yes build-essential libboost-all-dev libasio-dev avahi-utils
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
RUN gdown https://drive.google.com/uc?id=1zBniW4mluz3QW_7xngNL8gX692sUq39N
RUN tar -xzvf bridge_v0.3.0.tar.gz
RUN mv bridge_v0.3.0 bridge
RUN rm *.tar.gz


# ROS Packages
RUN apt-get install --assume-yes ros-melodic-rqt-robot-steering ros-melodic-rviz ros-melodic-compressed-image-transport 
RUN apt-get install --assume-yes ros-melodic-navigation ros-melodic-teb-local-planner ros-melodic-joint-state-publisher
RUN apt-get install --assume-yes ros-melodic-joint-state-publisher-gui ros-melodic-robot-state-publisher
WORKDIR /root
RUN gdown https://drive.google.com/uc?id=1jsc1IqPWr-CQc9zhl0H39nQIofyz91zZ
RUN tar -xzvf raya_unity_ws_20210901.tar.gz
RUN rm -rf *.tar.gz
WORKDIR /root/raya_unity_ws
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && catkin_make"
RUN echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc
RUN echo 'source ~/raya_unity_ws/devel/setup.bash' >> /root/.bashrc

# Launch Scripts
WORKDIR /root
COPY ./launch_connection.sh /root/
RUN chmod +x /root/launch_connection.sh

WORKDIR /root

