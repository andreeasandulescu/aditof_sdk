cmake_minimum_required(VERSION 2.8.3)

if(UNIX)

	#set variables
	if(NOT DEFINED CATKIN_WS)
		message("-- Creating catkin workspace in build directory")
		set(CATKIN_WS "${CMAKE_BINARY_DIR}/catkin_ws")
	else()
		message("-- Creating catkin workspace in user chosen directory: ${CATKIN_WS}")
	endif()
	set(ROS_SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

	#create and run ROS setup script
	configure_file(${CMAKE_CURRENT_SOURCE_DIR}/ros_setup.bash ${CMAKE_BINARY_DIR}/tmp/ros_setup.bash)
	file(
	    COPY ${CMAKE_BINARY_DIR}/tmp/ros_setup.bash
	    DESTINATION ${CMAKE_BINARY_DIR}
	    FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
	    )

	add_custom_target(aditof_ros_package ALL)
	add_custom_command(TARGET aditof_ros_package POST_BUILD
			COMMAND ${CMAKE_BINARY_DIR}/ros_setup.bash
			DEPENDS aditof
			)
endif()
