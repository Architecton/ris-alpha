#!/usr/bin/env python


### IMPORTS ###
import numpy as np
import rospy
import actionlib
from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import tf2_ros
import tf2_geometry_msgs

from targetmarker import TargetMarker
### /IMPORTS ###




### INITIALIZATIONS ###

# Initialize TargetMarker instance.
tm = TargetMarker()

# example of marking a target:
# tm.push_position(np.array([0.2, 0.3, 0.5]))


# Initialize action clients
ac_chkpnts = actionlib.SimpleActionClient("move_base", MoveBaseAction)
ac_ellipses = actionlib.SimpleActionClient("move_base", MoveBaseAction)

# Initialize checkpoints array.
checkpoints = np.array([[-1.276, 2.121, 0.850], [0.421, 0.166, 0.597], [2.195, 0.723, 0.999], [1.832, 2.986, 0.882], [0.036, 2.124, 0.855]])
checkpoint_ctr = 0

# Initialize found ellipses storage.
resolved_ell = np.empty((0, 2), dtype=float)

# Set distance threshold to consider ellipse as unresolved.
DISTINCT_ELL_THRESH = 1.0

self.tf2_buffer = tf2_ros.Buffer()  # initialize coordinate transforms buffer.

# Get robot position in map coordinates.
trans = self.tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
robot_pos = np.array([trans.translation.x, trans.translation.y, trans.translation.z]) 

# Wait for ellipse data buffer query service to come online.
# rospy.wait_for_service('ellipse_locator')
# ellipse_locator = rospy.ServiceProxy('ellipse_locator', EllipseLocator)

### /INITIALIZATIONS ###





# While there are checkpoints left **main search loop**
while checkpoints.shape[0] > 0:

    # Get index of closest checkpoint.
    idx_nxt = np.argmin((lambda x1, x2: np.sum(np.abs(x1 - x2)**2)**(1/2))(robot_pos, checkpoints))
    
    # Create goal for next checkpoint.
    goal_chkpt = MoveBaseGoal()
    goal_chkpt.target_pose.header.frame_id = "map"
    goal_chkpt.target_pose.header.stamp = rospy.Time.now()
    goal_chkpt.target_pose.pose.position.x = checkpoints[idx_nxt, 0]
    goal_chkpt.target_pose.pose.position.y = checkpoints[idx_nxt, 1]
    goal_chkpt.target_pose.pose.orientation.w = checkpoints[idx_nxt, 2]

    goal_chkpnt_status = GoalStatus.LOST  # Set status for next checkpoint goal.
    ac_chkpnts.send_goal(goal_chkpt) # Send checkpoint goal.
    rospy.loginfo("Resolving checkpoint {0}".format(checkpoint_ctr))

    # Loop for next checkpoint goal.
    while not goal_chkpnt_status == GoalStatus.SUCCEEDED:

        # Check if any ellipses if buffer.
        """
        try:
            # Query into ellipse data buffer.
            ellipse_data = ellipse_locator()
            
            # If ellipse data found in buffer, create new ellipse resolution goal.
            if ellipse_data:

                # Check if ellipse had not yet been resolved.
                if not np.any((lambda x1, x2: np.sum(np.abs(x1 - x2)**2)**(1/2))(np.array([ellipse_data[0], ellipse_data[1], ellipse_data[2]]), resolved_ell) > DISTINCT_ELL_THRESH):
                 


                    ### DEBUG PLOT ###

                    # DEBUG mark goal - mark ellipse center location.
                    tm.push_position(np.array(ellipse_data[:3]))
                    # tm.push_position(np.array(ellipse_data[3:])) # if marking ellipse approach target.

                    ### /DEBUG PLOT ###



                    
                    # Create goal to approach found ellipse.
                    goal_ell = MoveBaseGoal()
                    goal_ell.target_pose.header.frame_id = "map"
                    goal_ell.target_pose.header.stamp = rospy.Time.now()
                    goal_ell.target_pose.pose.position.x = ellipse_data[3]  # Set goal in front of face of the ellipse.
                    goal_ell.target_pose.pose.position.y = ellipse_data[4]
                    goal_ell.target_pose.pose.orientation.w = ellipse_data[5]

                    # Initialize goal status.
                    goal_nxt_ell_status = GoalStatus.LOST

                    # Send goal to action manager for resolving ellipses - preempt checkpoint search goal.
                    ac_ellipses.send_goal(goal_ell)

                    # Go to position.
                    while not goal_nxt_ell_status == GoalStatus.SUCCEEDED:
                        ac_ellipses.wait_for_result(rospy.Duration(1))
                        goal_nxt_ell_status = ac_ellipses.get_state()

                        # Handle abortions.
                        if goal_state == GoalStatus.ABORTED or goal_state == GoalStatus.REJECTED: 
                            rospy.loginfo("Ellipse resolution goal aborted")
                            break

                    # TODO speak
                    print("Ellipse resolved")

                    # Add ellipse to array of resolved ellipses.
                    resolved_ell = np.vstack((resolved_ell, np.array([ellipse_data[0], ellipse_data[1], ellipse_data[2]])))
                    # Resend preempted checkpoint goal.
                    ac_chkpnts.send_goal(goal)

                else:
                    pass
        except rospy.ServiceException, e:
            print "Service call failed: {0}".format(e)
        
        """

        ac_chkpnts.wait_for_result(rospy.Duration(1))

        # Get checkpoint resolution goal status.
        goal_chkpnt_status = ac_chkpnts.get_state()

        # Handle abortions
        if goal_state == GoalStatus.ABORTED or goal_state == GoalStatus.REJECTED:
            rospy.loginfo("Checkpoint resolution goal aborted")
            break


    
    # Remove checkpoint from checkpoints array
    checkpoints = numpy.delete(checkpoints, (idx_nxt), axis=0)

    # Get robot position in map coordinates.
    trans = self.tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
    robot_pos = np.array([trans.translation.x, trans.translation.y, trans.translation.z])
    checkpoint_ctr += 1  # Increment checkpoint counter.
