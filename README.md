# KBOT Tools
## Install ROS Noetic on PC
Setup your PC and install Ubuntu 20.04.x on your PC
- Ubuntu 20.04.4 LTS [Focal Fossa](https://releases.ubuntu.com/20.04/ubuntu-20.04.4-desktop-amd64.iso)
- [Rufus](https://objects.githubusercontent.com/github-production-release-asset-2e65be/2810292/61be0dd1-b1c3-4ae8-beac-ea37ca3bab3e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220804%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220804T135217Z&X-Amz-Expires=300&X-Amz-Signature=9a4c457faaabd68219758a3a78b6537b24163bd0b2a11a87962e46ed3e3792e4&X-Amz-SignedHeaders=host&actor_id=89779525&key_id=0&repo_id=2810292&response-content-disposition=attachment%3B%20filename%3Drufus-3.20.exe&response-content-type=application%2Foctet-stream)

```sh
$ sudo apt update
$ sudo apt upgrade -y
$ wget https://raw.githubusercontent.com/aims-lab-kmitl/kbot_tools/main/aims_install_ros.sh
$ chmod 755 ./aims_install_ros.sh
$ bash ./aims_install_ros.sh
$ source ~/.bashrc
```

## Install ROS Noetic on Raspberry Pi
Setup SD card and install Ubuntu 20.04.x on Raspberry Pi
- Download [Raspberry Pi Imager](https://www.raspberrypi.com/software/)

```sh
$ sudo apt update
$ sudo apt upgrade -y
$ wget https://raw.githubusercontent.com/aims-lab-kmitl/kbot_tools/main/aims_install_ros_rp.sh
$ chmod 755 ./aims_install_ros_rp.sh
$ bash ./aims_install_ros_rp.sh
$ source ~/.bashrc
```

## Install Turtlebot3 Simulation
Credit : [Turtlebot3](https://github.com/ROBOTIS-GIT)
```sh
$ sudo apt update
$ sudo apt upgrade -y
$ wget https://raw.githubusercontent.com/aims-lab-kmitl/kbot_tools/main/aims_install_turtlebot.sh
$ chmod 755 ./aims_install_turtlebot.sh
$ bash ./aims_install_turtlebot.sh
$ source ~/.bashrc
```
