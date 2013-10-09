Taskbar adds a taskbar to the top of your monitors. 


To install add the following lines of code to the bottom of Main.ahk. Make sure to put the second line beneath all the other plugins (It may cause bugs otherwise).
#include Plugins\Taskbar\Fnt.ahk
#include Plugins\Taskbar\Taskbar.ahk

After that add these two commands to your config file.
taskEnable()
taskActivate()

Optional (To edit the taskbar settings)
TaskFont(Font Face, Font Size, Font Colour): The parameters are fairly self explanatory for this one. It sets the fnt options for the text on the taskbar.

taskOption(Taskbar Height, Downward Shift, Taskbar Colour): taskOption() sets some basic options for the script. The first parameter is the height of the bar. The second parameter is the downward shift of all the text on the bar. The third parameter is the colour of the bar.

taskLayout(Layout): taskLayout() sets the taskbar layout. For more information on how the taskbar layout works read the section on it down below.

taskCommand(Command Symbol, Default Search, Program location): taskCommand() sets settings for the command bar. The first parameter sets the symbol used to designate commands. The second parameter set the default seacrh engine. 2 for DuckDuckGo or anything else for Google. The third parameter is the folder location of the programs you can launch from the bar.

taskRun(Extension 1, Extension 2, ..., Extension n): taskRun() is used to set what types of files can be oppened via the run bar. By default .exe and .lnk can be oppened. This command can zccept an infinite number of parameters.


Taskbar adds 2 new key:
# + Space Bar: Open the run command bar.
# + Ctrl +  Space Bar: Open the run command bar with the current contents of the clipboard in the box.


Taskbar Layout Commands (Note You can only have one copy of each item on each monitors taskbar)
clockT(): No parameters are currently accepted by clock(). This command displays the time in "A_Hour.A_Min" format.

calT(): This command accepts no parameters. It displays the date in "A_DDD, A_MMM A_DD" format.

workT(Mode): This command displays the current workspace. If you enter no parameter it will display only the current workspace's number. If you input the parameter "Full" then it will display all 9 workspaces and inform you of which you are on by marking it with a "#".

textT(Text): This command displays whatever text you input as the parameter.

When making a layout you must write it in the form "cmd()&[cmd()]&cmd()". The & signify the addition of another command. The "[" and "]" represent the items that will be centered on the taskbar. The items on the outside of the brackets will be shifted all the way to the edge of there respective sides. An example woul be:
workT(Full)&[]&clockT()
To then set this as a bar layout use the command taskLayout(m,x) where x is your layout and m is the monitor you are assigning the layout to. For example you could write this:
taskLayout(2,workT(Full)&[]&clockT())