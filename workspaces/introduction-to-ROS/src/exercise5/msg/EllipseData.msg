#Found flag that takes on values 1 or 0 (ellipse detected or not)
uint8 found

#Depth value at pixel representing the centre of the found ellipse
#Contains garbage if found flag value equal to 0
float64 dpt

#angle_min + index_center*angle_increment
float64 agl

#result of rospy.Time.now().to_time() when image taken
float64 timestamp
