# KBOT Tools
## Install ROS Noetic on PC
Setup your PC and install Ubuntu 20.04.x on your PC
- Ubuntu 20.04.4 LTS (Focal Fossa): https://releases.ubuntu.com/20.04/ubuntu-20.04.4-desktop-amd64.iso
- Rufus: https://rufus.ie/

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
- Raspberry Pi Imager: https://www.raspberrypi.com/software/

```sh
$ sudo apt update
$ sudo apt upgrade -y
$ wget https://raw.githubusercontent.com/aims-lab-kmitl/kbot_tools/main/aims_install_ros_rp.sh
$ chmod 755 ./aims_install_ros_rp.sh
$ bash ./aims_install_ros_rp.sh
$ source ~/.bashrc
```
