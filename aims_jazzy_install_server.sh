#!/bin/bash

# Exit on any error
set -e

# Countdown function
countdown() {
    echo "🚀 ROS 2 Jazzy installation will begin shortly..."
    echo "👉 Press Enter to start immediately or Ctrl+C to cancel."
    
    for i in {10..1}; do
        echo -ne "⏳ Starting in $i seconds... \r"
        read -t 1 -n 1 key && break
    done
    echo -e "\n🔧 Starting installation..."
}

countdown

echo "🔧 Checking and setting locale to UTF-8..."
locale

sudo apt update
sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale

echo "📦 Installing software-properties-common and enabling universe repo..."
sudo apt install -y software-properties-common
sudo add-apt-repository universe

echo "🌐 Installing curl..."
sudo apt update
sudo apt install -y curl

echo "📥 Installing ROS 2 apt source (ros2-apt-source)..."
ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest \
  | grep -F "tag_name" \
  | awk -F\" '{print $4}')

UBUNTU_CODENAME=$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})

curl -L -o /tmp/ros2-apt-source.deb \
  "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.${UBUNTU_CODENAME}_all.deb"

sudo dpkg -i /tmp/ros2-apt-source.deb

echo "📦 Updating apt and installing ROS 2 Jazzy..."
sudo apt update
sudo apt install -y ros-dev-tools ros-jazzy-ros-base

echo "🔁 Setting up environment sourcing..."
echo "source /opt/ros/jazzy/setup.bash" >> ~/ros_environment.bash
echo "source \$HOME/ros_environment.bash" >> ~/.bashrc

echo "✅ ROS 2 Jazzy installation complete."
echo "💡 Run 'source ~/.bashrc' or restart your terminal to apply changes."
