cmake_minimum_required(VERSION 2.8.3)
project(task1)

find_package(catkin REQUIRED COMPONENTS
  	roscpp
	rospy
	cv_bridge
	sensor_msgs
	visualization_msgs
	nav_msgs
	std_msgs
	geometry_msgs
	tf2
	tf2_geometry_msgs
)

find_package( OpenCV REQUIRED )

add_message_files(
	FILES
	EllipseData.msg
)

generate_messages(
	DEPENDENCIES
	std_msgs
)

catkin_package(
	CATKIN_DEPENDS message_runtime
)

include_directories(
# include
	${catkin_INCLUDE_DIRS}
)
