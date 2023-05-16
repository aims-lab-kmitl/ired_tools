#!/bin/bash

echo ""
echo "AIMs Lab x RAI KMITL"
echo ""
echo "Turtlebot Installation"
echo "OS version: Ubuntu 20.04.x (Focal Fossa)"
echo "ROS version: ROS Noetic Ninjemys"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read

echo "[Setup Work Space: ROS_TURTLEBOT3]"
mkdir -p $HOME/ROS_TURTLEBOT3/src
cd $HOME/ROS_TURTLEBOT3/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
cd turtlebot3
git checkout -t origin/noetic-devel
cd $HOME/ROS_TURTLEBOT3/src
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git

echo "[Install gmapping, ]"
sudo apt install -y ros-noetic-slam-gmapping ros-noetic-map-server ros-noetic-amcl \
                    ros-noetic-move-base ros-noetic-navigation

echo "[Catkin Make Work Space]"
cd $HOME/ROS_TURTLEBOT3
catkin_make
source $HOME/ROS_TURTLEBOT3/devel/setup.bash
sh -c "echo \"source ~/ROS_TURTLEBOT3/devel/setup.bash\" >> ~/.bashrc"

echo "[COMPLETE !!!]"
exit 0
