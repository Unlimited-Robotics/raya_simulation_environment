Copyright 2020 Unlimited Robotics

# Unlimited Robotics - Simulation Containers

Linux Images for Unlimited Robotics ROS Workspace

## 0. Clone the Repository

``` bash
# Clone using HTTPS
mkdir -p ~/ur/ && cd ~/ur/
git clone --recurse-submodules https://github.com/Unlimited-Robotics/raya_linux_images ./linux_images/
cd ~/ur/linux_images
```

``` bash
# Clone using SSH
mkdir -p ~/ur/ && cd ~/ur/
git clone --recurse-submodules git@github.com:Unlimited-Robotics/raya_linux_images.git ./linux_images/
cd ~/ur/linux_images
```

## 2. Execution

### 2.1 Unity Simulator

First, launch the Unity simulator. Download the last build from [here](https://drive.google.com/drive/folders/1DFtWDQ-M6Jqbki_kkaV9_NSIQMhwCylo), and execute the `rayasim.x86_64` binary.


### 2.2 DDS Bridge and RESTful API

#### 2.2.1 Install Docker

Make sure you have Docker installed and your user can execute docker. (you can follow [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04))

#### 2.2.2 Install docker-compose

You can follow the [official guide](https://docs.docker.com/compose/install/) to install `docker-compose` on your machine. 

#### 2.2.3 Build and launch containers

To build the images and run them you only need to execute the next command in project's base folder:
```bash
docker-compose up
```
or to run the containers in the background:
```bash
docker-compose up -d
```

After 20 seconds, you should see an output like:

```
...
(info) [20210902_032256] <RestfulService>: Service Initialized
(info) [20210902_032257] <NavigationService>: Service Initialized
UPDATE UNITY SIMULATOR WITH IP: 172.17.0.2
...
MainThread : on : startup : 38 : Application startup complete.
```

After that you can open http://localhost:8000/examples and follow the instructions to connect and use RESTful API

### 2.3. Finish the simulation

To finish the simulation, press Ctrl+C in the docker terminal (if you are not running containers in the background) and close the Unity simulator. Then, stop the docker containers:

To stop the containers:
```bash
docker-compose down
```
