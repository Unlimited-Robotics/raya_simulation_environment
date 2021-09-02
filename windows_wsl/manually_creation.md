# Manually creating the WSL distro

## Base image creation

Download the Ubuntu 18.04 image from https://aka.ms/wsl-ubuntu-1804.

Uncompress with 7-zip and extract the `install.tar.gz` file.

Create the `C:\users\<your_user>\ur` if it doesn't exists, and copy the `install.tar.gz` file there.

Then, open a *PowerShell* terminal and run:

``` powershell
cd ~/ur/
wsl --import raya "$HOME/ur/raya_sim" .\install.tar.gz
```

Then, start the linux machine:

``` powershell
wsl -d raya
```

## WSL Image preparation

First steps:

``` bash
cd ~
sed -i '/#force_color_prompt=yes/c\force_color_prompt=yes' /root/.bashrc
echo '' >> /root/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> /root/.bashrc
source /root/.bashrc
```

Install general dependencies

``` bash
apt update
apt upgrade
apt install --assume-yes nano lsb-release git dos2unix xterm openssh-client wget tar curl
apt-get install --assume-yes python-pip
pip install gdown
```

Install ROS Base:

``` bash
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
apt update
apt install --assume-yes ros-melodic-ros-base
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

Install FastDDS 2.3.0

``` bash
## FastDDS 2.3.0 Installation
apt-get install --assume-yes build-essential libboost-all-dev libasio-dev avahi-utils
mkdir -p /root/ur/deps
cd /root/ur/deps
gdown https://drive.google.com/uc?id=1oNQId92JutwbqlHytrKJUFYQK-tkY5sM
tar zxvf fast_dds_2.3.0_ubuntu18.04.tar.gz
cp -r ./local/ /usr/
## Remove dependencies installation files
cd /root
rm -r /root/ur/deps
```

Install Raya DDS-Robot Bridge

``` bash
cd /root/ur
gdown https://drive.google.com/uc?id=1a7tEFdbzy6715oT502nqd19zMmojw_31
tar -xzvf bridge_v0.2.1.tar.gz
mv bridge_v0.2.1 bridge
rm *.tar.gz
```

ROS Packages

``` bash
apt-get install --assume-yes ros-melodic-rqt-robot-steering ros-melodic-rviz ros-melodic-compressed-image-transport
cd /root
git clone https://nadavsholev-ur:Ns131092@gitlab.com/unlimited-robotics/ros-workspaces/raya_unity_ws.git
cd /root/raya_unity_ws/src
git clone https://nadavsholev-ur:Ns131092@gitlab.com/unlimited-robotics/ros-workspaces/ros-packages/raya_control.git
git clone https://nadavsholev-ur:Ns131092@gitlab.com/unlimited-robotics/ros-workspaces/ros-packages/raya_simulation_unity.git
git clone https://nadavsholev-ur:Ns131092@github.com/Unity-Technologies/ROS-TCP-Endpoint.git
git clone https://nadavsholev-ur:Ns131092@gitlab.com/unlimited-robotics/ros-workspaces/ros-packages/raya_msgs.git
cd /root/raya_unity_ws/
catkin_make
echo 'source ~/raya_unity_ws/devel/setup.bash' >> /root/.bashrc
source ~/.bashrc
```

# Launch Scripts
cd /root
# Manually copy all the scripts into /root
dos2unix /root/launch_*.sh
chmod +x /root/launch_*.sh

# Export the WSL distro
# wsl  --export raya raya.tar.gz