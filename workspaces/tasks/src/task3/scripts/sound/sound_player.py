#!/usr/bin/env python

import rospy
from sound_play.libsoundplay import SoundClient
from task3.msg import SayCommand

class SoundPlayer:

    def __init__(self):
        rospy.init_node('sound_player', anonymous = True)
        self._command_listener = rospy.Subscriber('say_commands', SayCommand, self._say)

        # Initialize sound node.
        self._soundhandle = SoundClient()
        rospy.sleep(1)
        self._volume = 1.0
        rospy.spin()

    def _say(self, data):

	print data.text

	# STAGE 1
        if data.text == '1intro':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/intro.wav', self._volume)
        if data.text == '1detecting_qr_code_and_pattern':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/trying_both.wav', self._volume) # FIX
        if data.text == '1detecting_qr_code':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/trying_qr.wav', self._volume)
        if data.text == '1detecting_pattern':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/trying_pattern.wav', self._volume)
        if data.text == '1pattern_detected':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/pattern_success.wav', self._volume)
        if data.text == '1qr_code_detected':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/qr_success.wav', self._volume)
        if data.text == '1zero':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/zero.wav', self._volume)
        if data.text == '1one':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/one.wav', self._volume)
        if data.text == '1two':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/two.wav', self._volume)
        if data.text == '1three':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/three.wav', self._volume)
        if data.text == '1rotation':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/rotation.wav', self._volume)
        if data.text == '1next_teckpoint':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/next_checkpoint.wav', self._volume)


	# STAGE 2	
        if data.text == '2rotation':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/rotation.wav', self._volume)
        if data.text == '2detecting':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/2detecting.wav', self._volume)
        if data.text == '2red_cyl':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/2red.wav', self._volume)
        if data.text == '2green_cyl':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/2green.wav', self._volume)
        if data.text == '2blue_cyl':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/2blue.wav', self._volume)
        if data.text == '2yellow_cyl':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/2yellow.wav', self._volume)
        if data.text == '2detecting_qr_code':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/trying_qr.wav', self._volume)
        if data.text == '2red':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/qr_red.wav', self._volume)
        if data.text == '2green':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/qr_green.wav', self._volume)
        if data.text == '2blue':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/qr_blue.wav', self._volume)
        if data.text == '2black':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/qr_black.wav', self._volume)
        if data.text == '2next_checkpoint':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/next_checkpoint.wav', self._volume)

	# STAGE 3
        if data.text == '3initialization':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/initialization.wav', self._volume)
        if data.text == '3starting_search':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/starting_search.wav', self._volume)
        if data.text == '3detected':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/detected.wav', self._volume)
        if data.text == '3red':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/red.wav', self._volume)
        if data.text == '3green':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/green.wav', self._volume)
        if data.text == '3blue':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/blue.wav', self._volume)
        if data.text == '3black':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/black.wav', self._volume)
        if data.text == '3verifying':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/verifying.wav', self._volume)
        if data.text == '3done':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/done.wav', self._volume)

     
        # STAGE 4
        if data.text == '4rotation':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/rotation.wav', self._volume)
        if data.text == '4map_interpretation':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/trying_map.wav', self._volume)
        if data.text == '4map_success':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/map_success.wav', self._volume)
        if data.text == '4next_checkpoint':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/next_checkpoint.wav', self._volume)
        if data.text == '4detecting':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4detecting.wav', self._volume)
        if data.text == '4red':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4red.wav', self._volume)
        if data.text == '4green':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4green.wav', self._volume)
        if data.text == '4yellow':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4yellow.wav', self._volume)
        if data.text == '4black':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4black.wav', self._volume)
        if data.text == '4blue':
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/4blue.wav', self._volume)

        # STAGE 5
        if data.text == '5start':  # TODO
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/5start.wav', self._volume)
        if data.text == '5finish':  # TODO
             self._soundhandle.playWave('/home/team_alpha/ris-alpha/workspaces/tasks/src/task3/scripts/sound/5finish.wav', self._volume)


        # TODO detecting ellipse color
        # TODO detecting cylinder color




if __name__ == '__main__':
    sp = SoundPlayer()

