#!/usr/bin/env python

import rospy
import dynamic_reconfigure.client
from task3.srv import ReconfigParams

"""
Instructions:
$ rosdep install dynamic_reconfigure 
$ rosmake dynamic_reconfigure 
"""

class Reconfig:
    def __init__(self):

        # Init service
        rospy.init_node('reconfig_service', anonymous=True)

        # Init reconfiguration client
        self.client = dynamic_reconfigure.client.Client('/cmd_vel_mux')
        # self.client = dynamic_reconfigure.client.Client('/dwa_local_planner_params') 

        # Init service callback
        s = rospy.Service('reconfig_params', ReconfigParams, self.reconfigure_cb)

    def reconfigure_cb(self,data):

        """
        try:
            params = { 'min_trans_vel' : data.min_trans_vel, 'min_rot_vel' : data.min_rot_vel, 'rot_stopped_vel' : data.rot_stopped_vel }
            onfig = self.client.update_configuration(params)
            print(config)
            return True
        except:
            return False
        """

        try:
            params = { data.param_name : data.param_val }
            config = self.client.update_configuration(params)
            print(config)
            return True
        except:
            return False

def main():

    reconfig_service = Reconfig()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

if __name__ == '__main__':
    main()