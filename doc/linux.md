# Raya Unity Simulator - Linux Setup

Tested with:

* Ubuntu 18.04
* Ubuntu 20.04
* Linux Mint 20.2

## 0. Clone Repository

``` bash
# Clone using HTTPS
mkdir -p ~/ur/ && cd ~/ur/
git clone https://github.com/Unlimited-Robotics/raya_linux_images ./linux_images/
cd ~/ur/linux_images
git checkout devel # Only for get last not stable version
```

``` bash
# Clone using SSH
mkdir -p ~/ur/ && cd ~/ur/
git clone git@github.com:Unlimited-Robotics/raya_linux_images.git ./linux_images/
cd ~/ur/linux_images
git checkout devel # Only for get last not stable version
```

## 2. Docker Image

### 2.1. Install Docker

Make sure you have Docker installed and your user can execute docker. (you can follow [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04))

### 2.2. Build and launch container image

``` bash
cd ~/ur/linux_images/linux_docker/
docker build -t ros:raya_linux .
```

Run the container:

``` bash
docker run -t -d -p 10000:10000 -p 5005:5005 --privileged --name=raya_sim ros:raya_linux
```

For debugging:

``` bash
# With GUI:
docker run -t -d -p 10000:10000 -p 5005:5005 --name=raya_sim --gpus=all --privileged --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" ros:raya_linux
# With GUI and GPU:
docker run -t -d -p 10000:10000 -p 5005:5005 --name=raya_sim --privileged --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" ros:raya_linux
```

## 3. Execution

First, launch the Unity simulator. Download the last build from [here](https://drive.google.com/drive/folders/1DFtWDQ-M6Jqbki_kkaV9_NSIQMhwCylo), and execute the `rayasim.x86_64` binary.

Launch the DDS Bridge and the ROS Unity connection:

``` bash
docker restart raya_sim
docker exec -it raya_sim /root/launch_connection.sh
```

After 5 seconds, you should see an output like:

```
...
(info) [20210902_032256] <RestfulService>: Service Initialized
(info) [20210902_032257] <NavigationService>: Service Initialized
UPDATE UNITY SIMULATOR WITH IP: 172.17.0.2
```

To finish the simuation, press Ctrl+C in the docker terminal and close the Unity simulator. Then, stop the docker container:

``` bash
docker stop raya_sim
```

