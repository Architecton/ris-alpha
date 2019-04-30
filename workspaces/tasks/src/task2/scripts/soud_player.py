#!/usr/bin/env python

import rospy
from sound_play.libsoundplay import SoundClient


class SoundPlayer:

    """
    Listener for speech commands.
    """

    def __init__(self):
        rospy.init_node('sound_player', anonymous = True)
        #self._command_listener = rospy.Subscriber('sound_command', SayCommand, self._say)
        # Initialize sound node.
        self._soundhandle = SoundClient()
        rospy.sleep(1)
        self._voice = 'voice_kal_diphone'
        self._volume = 1.0
        rospy.spin()

    def _say(self, data):

        """
        Handle request for speech command.
        """
    
        # TODO - set absolute paths
        if data == 'initialization':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/initialization.wav', self._volume)
        elif data == 'starting_search':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/starting_search.wav', self._volume)
        elif data == 'detected':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/detected.wav', self._volume)
        elif data == 'red':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/red.wav', self._volume)
        elif data == 'green':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/green.wav', self._volume)
        elif data == 'blue':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/blue.wav', self._volume)
        elif data == 'black':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/black.wav', self._volume)
        elif data == 'verifying':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/verifying.wav', self._volume)
        elif data == 'done':
             self._soundhandle.playWave('/home/jernej/Desktop/Repositories/classes/third-year/intelligent-systems-development/ris-alpha/workspaces/tasks/src/task2/scripts/sound/done.wav', self._volume)


if __name__ == '__main__':
    sp = SoundPlayer()  # Initialize class

