#!/bin/bash

DISTRO_CODENAME=$( (lsb_release -sc || . /etc/os-release; echo ${VERSION_CODENAME} ) 2>/dev/null)

#determine ROS distribution
if [ $DISTRO_CODENAME = "bionic" ]
then
	ROS_DISTRO="melodic"
elif [ $DISTRO_CODENAME = "xenial" ]
then
	ROS_DISTRO="kinetic"
fi

mkdir -p ${CATKIN_WS}/src
cd ${CATKIN_WS}/src
ln -sf ${ROS_SRC_DIR}/aditof_roscpp ${CATKIN_WS}/src/aditof_roscpp

cd ${CATKIN_WS}
source /opt/ros/$ROS_DISTRO/setup.sh
catkin_make
