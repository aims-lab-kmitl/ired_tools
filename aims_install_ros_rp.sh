#!/bin/bash

echo ""
echo "AIMs Lab x RAI KMITL"
echo "OS version: Ubuntu 20.04.x (Focal Fossa)"
echo "ROS version: ROS Noetic Ninjemys"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Update the package lists]"
sudo apt update
sudo apt upgrade -y

echo "[Setup your sources.list]"
sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main\" > /etc/apt/sources.list.d/ros-latest.list"

echo "[Set up your keys]"
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

echo "[Update the package lists]"
sudo apt update
sudo apt upgrade -y

echo "ROS-Base: (Bare Bones)"
sudo apt install -y ros-noetic-ros-base

echo "[Environment setup]"
sh -c "echo \"source /opt/ros/noetic/setup.bash\" >> ~/.bashrc"
source /opt/ros/noetic/setup.bash
source $HOME/.bashrc

echo "[Dependencies for building packages]"
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

echo "[Initialize rosdep and Update]"
sudo sh -c "rosdep init"
rosdep update

echo "[Complete!!!]"
exit 0
