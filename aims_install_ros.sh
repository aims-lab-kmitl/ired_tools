#!/bin/bash

# Exit on any error
set -e

# Countdown function
countdown() {
    echo "🚀 ROS 1 Noetic installation will begin shortly..."
    echo "👉 Press Enter to start immediately or Ctrl+C to cancel."
    
    for i in {10..1}; do
        echo -ne "⏳ Starting in $i seconds... \r"
        read -t 1 -n 1 key && break
    done
    echo -e "\n🔧 Starting installation..."
}

countdown

echo "[📦 Update the package lists]"
sudo apt update
sudo apt upgrade -y

echo "[🔑 Setup your sources.list]"
sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main\" > /etc/apt/sources.list.d/ros-latest.list"

echo "🌐 [Set up your keys]"
sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

echo "[Update the package lists]"
sudo apt update
sudo apt upgrade -y

echo "📥 ROS-Desktop: (Desktop Full)"
sudo apt install -y ros-noetic-desktop-full

echo "[Environment setup]"
sh -c "echo \"source /opt/ros/noetic/setup.bash\" >> ~/ros_environment.bash"
sh -c "echo \"source \$HOME/ros_environment.bash\" >> ~/.bashrc"
source /opt/ros/noetic/setup.bash
source $HOME/.bashrc

echo "[Dependencies for building packages]"
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

echo "[Initialize rosdep and Update]"
sudo sh -c "rosdep init"
rosdep update

sh -c "echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/ros_environment.bash"
sh -c "echo \"export ROS_HOSTNAME=localhost\" >> ~/ros_environment.bash"

echo "[Complete!!!]"
exit 0
