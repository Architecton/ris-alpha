cmake_minimum_required(VERSION 2.8.3)
project(task3)

## Find system dependencies
find_package(Boost REQUIRED COMPONENTS system filesystem thread)
find_package(Eigen3 REQUIRED)
find_package(PCL REQUIRED)
find_package(OpenCV REQUIRED)
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
	message_generation
	map_server
  dynamic_reconfigure
  genmsg
  nodelet
  nodelet_topic_tools
  pcl_conversions
  pcl_msgs
  pluginlib
  rosbag
  rosconsole
  tf2_ros
)

## Find catkin packages
add_message_files(
   FILES
   ApproachImageFeedback.msg
   TerminalApproachFeedback.msg
   CylinderImageFeedback.msg
   ValidRegionsMapResponse.msg
   RingApproachPointResponse.msg
   SayCommand.msg
   Checkpoints.msg
   EllipseData.msg
   ScanFlag.msg
   CheckpointProcessorResponse.msg 
   RingData.msg
   CylinderData.msg
   TreasureLocatorResponse.msg
)

add_service_files(
  FILES
  TerminalApproach.srv 
  ValidRegionsMap.srv 
  RingApproachPoint.srv 
  FeatureBuilder.srv
  ColourClassificationSrv.srv
  Checkpoint_res.srv
  CheckpointProcessor.srv
  EllipseLocator.srv
  CylinderLocator.srv
  QRDetector.srv
  DigitDetector.srv
  TreasureLocator.srv
)

generate_messages(
   DEPENDENCIES
   std_msgs
   geometry_msgs
   sensor_msgs
)

## Add include directories
include_directories(
  ${Boost_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
  ${Eigen_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
)

## Add link directories
link_directories(
  ${Boost_LIBRARY_DIRS}
  ${Eigen_LIBRARY_DIRS}
  ${PCL_LIBRARY_DIRS}
  ${catkin_LIBRARY_DIRS}
)

link_libraries(${Boost_LIBRARIES} ${catkin_LIBRARIES} ${PCL_LIBRARIES})

## Declare the catkin package
catkin_package(
  LIBRARIES
    pcl_ros_filters
    pcl_ros_io
    pcl_ros_tf
  CATKIN_DEPENDS
    dynamic_reconfigure
    pcl_conversions
    pcl_msgs
    roscpp
    sensor_msgs
    std_msgs
  DEPENDS
    Boost
    Eigen
    PCL
)

add_executable (cylinder_recognition src/cylinder_recognition/cylinder_recognition.cpp)