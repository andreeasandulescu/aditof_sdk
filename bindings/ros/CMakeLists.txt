cmake_minimum_required(VERSION 2.8.3)

if (NOT DEFINED ROS_DISTRO)
    set(ROS_DISTRO "melodic")
endif()

add_custom_target(ros_setup ALL)

add_custom_command (TARGET ros_setup PRE_BUILD
		COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/build
		COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/devel
		COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/install
		)

file (COPY /opt/ros/${ROS_DISTRO}/setup.sh DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/devel/ FILE_PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ)

add_custom_command (TARGET ros_setup
		COMMAND ${CMAKE_CURRENT_BINARY_DIR}/devel/setup.sh
		COMMAND cmake ${CMAKE_CURRENT_SOURCE_DIR}/aditof_roscpp -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/devel/install -DCATKIN_DEVEL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/devel
		
		WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/build
		)
