Media adds media and volume control keys to qt. To use the volume keys you must have nircmd intalled.


To install add the following line of code to the bottom of Main.ahk.
#include Plugins\Media\Media.ahk

Optional (Allow volume contorl)
Install nircmd and add the following command with proper parameters to the config file.
nircmd(Volume Change, Allow Beep on Volume Change, Frequency of Beep, Duration of Beep): nircmd() allows for the volume control. The first parameter determines the increase and decrease of the volume (2000 or so is a good value for this). The second parameter determines whether there is a beep when you change the volume. The third parameter is the frequency of the beep and the fourth parameter s the duration, in milliseconds, of the beep.


Fibonacci adds 1 new key:
# + Insert: Play/Pause
# + Home: Previous
# + PgUp: Next
# + Numpad Add: Increase Volume
# + Numpad Enter: Decrease Volume
# + Numpad Subtract: Mute