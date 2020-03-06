#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu ${TRAVIS_DIST} main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
if [ "{$ROS_DISTRO}"  = "melodic" ]; then sudo apt update -qq; else sudo apt-get update -qq;  fi
source /opt/ros/${ROS_DISTRO}/setup.bash
sudo rosdep init
rosdep update
