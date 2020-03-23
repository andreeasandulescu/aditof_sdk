# ROS Wrapper for the ADI ToF library

## Overview
This ROS package facilitates depth and IR data acquisition and processing for the Analog Devices depth cameras.

## Installation

- **Install the recommended [ROS distribution](http://wiki.ros.org/Distributions) for your operating system**
  - [ROS Install page](http://wiki.ros.org/ROS/Installation)
- **[Optional] Install additional ROS packages needed to build and run the examples**
  - [rviz](http://wiki.ros.org/rviz)\
    Run the command below for each package, replacing DISTRIBUTION with the name of the ROS distribution installed and PACKAGE with the name of the needed package.
  ```console
  sudo apt install ros-DISTRIBUTION-PACKAGE
  ```
- **Install the ADI ToF SDK library**
  - [Install SDK dependencies](https://github.com/analogdevicesinc/aditof_sdk/blob/6c7fb376aeec73a21ab177adf297c5781bcbd544/doc/linux/build_instructions.md#installing-the-dependencies)
  - Download and build the SDK, as well as enable ROS package building
```console
git clone https://github.com/analogdevicesinc/aditof_sdk
cd aditof_sdk
mkdir build && cd build
cmake -DWITH_EXAMPLES=off -DWITH_ROS=on -DCMAKE_PREFIX_PATH="/opt/glog;/opt/protobuf;/opt/websockets" ..
sudo cmake --build . --target install
```
 - **Build the aditof ros package**
  ```console
  cmake --build . --target aditof_ros_package
  ```

## Usage
- Camera node\
TODO
- Examples
  - Visualize point cloud in rviz
    ```console
    cd catkin_ws
    source devel/setup.bash
    roslaunch aditof_roscpp rviz_publisher.launch
    ```
     The last command should be run for cameras using an USB connection. For Ethernet\Wi-Fi connections, you should specify the camera's IP address, using the ip parameter, as shown below 
      ```console
      roslaunch aditof_roscpp rviz_publisher.launch ip:="127.0.0.1"
      ```
