cmake_minimum_required(VERSION 2.8.3)
project(exercise4)

find_package(catkin REQUIRED COMPONENTS
	roscpp
	rospy
	cv_bridge
	sensor_msgs
	nav_msgs
	std_msgs
	geometry_msgs
	tf2
	tf2_geometry_msgs
)

find_package(OpenCV)


add_service_files(
  FILES
  ForwardRange.srv
)

generate_messages(
	DEPENDENCIES
	std_msgs
)

catkin_package(
	CATKIN_DEPENDS message_runtime
)

include_directories(include ${catkin_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})
add_executable(map_goals src/map_goals.cpp)
target_link_libraries(map_goals ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})

