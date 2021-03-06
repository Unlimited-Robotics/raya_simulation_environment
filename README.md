Copyright 2020 Unlimited Robotics

# Unlimited Robotics - Simulation Containers

Linux Images for Unlimited Robotics ROS Workspace

## 0. Clone the Repository

Clone for production:

``` bash
# Clone using HTTPS
mkdir -p ~/ur/ && cd ~/ur/
git clone --recurse-submodules --depth 1 git@github.com:Unlimited-Robotics/raya_simulation_environment.git ./rayasim/
cd ~/ur/rayasim
```

Clone for developing:

``` bash
# Clone using SSH
mkdir -p ~/ur/ && cd ~/ur/
git clone --recurse-submodules git@github.com:Unlimited-Robotics/raya_simulation_environment.git ./rayasim/
cd ~/ur/rayasim
```

Save your `.env` file inside `./ggs`.

## 2. Execution

### 2.0. Install Docker

Make sure you have Docker installed and your user can execute it. You can follow one of the following guides:

* [Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
* [Other distros](https://docs.docker.com/engine/install/)
* [macOS](https://docs.docker.com/desktop/mac/install/)
* [Windows](https://docs.docker.com/desktop/windows/install/)

Now, you can follow the [official guide](https://docs.docker.com/compose/install/) to install `docker-compose` on your machine. 

### 2.1. Build Containers

Build all the needed containers by runnning (make sure Docker Engine is running, in macOS and Windows you can execute Docker GUI to make sure):

``` bash
cd ~/ur/rayasim
docker-compose build
```

### 2.2. Unity Simulator

*Before executing the containers*, you must run the Unity simulator.

Download the Unity simulator according to your OS (waiting for new link) .

### 2.3. Launch the containers

To run the images you only need to execute the next command in project's base folder:

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
...
MainThread : on : startup : 38 : Application startup complete.
```

After that you can open http://localhost:8000/examples and follow the instructions to connect and use RESTful API

### 2.3. Finish the simulation

To finish the simulation, press Ctrl+C in the docker terminal if you are not running containers in the background, otherwise run the next command:

To stop the containers:

```bash
docker-compose down
```

Then, close the simulator.
