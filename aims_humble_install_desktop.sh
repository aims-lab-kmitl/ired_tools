#!/bin/bash

set -e  # Exit on any error
set -u  # Treat unset variables as errors

# Countdown function
countdown() {
    echo "🚀 ROS 2 Humble installation will begin shortly..."
    echo "👉 Press Enter to start immediately or Ctrl+C to cancel."
    
    for i in {10..1}; do
        echo -ne "⏳ Starting in $i seconds... \r"
        read -t 1 -n 1 key && break
    done
    echo -e "\n🔧 Starting installation..."
}

# Start countdown
countdown

# Step 1: Set locale
echo "🌐 Configuring locale..."
locale  # check current locale
sudo apt update
sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify new locale

# Step 2: Install prerequisites
echo "⚙️ Installing prerequisites..."
sudo apt install -y software-properties-common curl
sudo add-apt-repository universe

# Step 3: Add ROS 2 APT repository
echo "📦 Adding ROS 2 APT repository..."
ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
DISTRO_CODENAME=$(. /etc/os-release && echo $VERSION_CODENAME)
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.${DISTRO_CODENAME}_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
sudo apt update

# Step 4: Upgrade system
echo "⬆️ Upgrading system packages..."
sudo apt upgrade -y

# Step 5: Install ROS 2 Humble
echo "🤖 Installing ROS 2 Humble Desktop..."
sudo apt install -y ros-humble-desktop

# Step 6: Setup environment
echo "🔗 Setting up ROS environment..."
echo "source /opt/ros/humble/setup.bash" >> ~/ros_environment.bash
echo "source \$HOME/ros_environment.bash" >> ~/.bashrc
source ~/ros_environment.bash

echo "✅ ROS 2 Humble installation completed!"
echo "💡 Open a new terminal or run 'source ~/ros_environment.bash' to use ROS 2."
