qt.pi (or qt for short) is a simple WM built in Auto Hot Key (AHK). I tried to keep it as minimal as possible (currently under 550 lines) while still being simple to use and easy to expand on. By default it has five layouts, top stack, bottom stack, left stack, right stack, and monocle. More layouts can easily be added if you ave a basic understanding of AHK. If you need help in development please read over the Plugins tutorial.


qt has 16 default hotkeys, though more can be added with plugins. The default hotkeys are (# = The Windows Key):
# + Q: Activates Left Stack Layout
# + W: Activates Bottom Stack Layout
# + E: Activates Top Stack Layout
# + R: Activates Right Stack Layout
# + A: Activates Monocle Layout
# + 1: Move to workspace 1.
# + 2: Move to workspace 2.
# + 3: Move to workspace 3.
# + 4: Move to workspace 4.
# + 5: Move to workspace 5.
# + 6: Move to workspace 6.
# + 7: Move to workspace 7.
# + 8: Move to workspace 8.
# + 9: Move to workspace 9.
# + Z: Tile the window.
# + X: Untile the window.



Config file editing. To change your qt settings you must edit the config.txt file in the Data folder. qt uses commands to change settings which makes it easy for plugins to add options but isn't the most intuitive for beginers. The default commands are (To use a command simply type the cmd(X1,X2,X3,...,Xn) where cmd is the name of the command and x are the parameters).

border(Vertical Border, Horizontal Border, Extra Vertical Border, Extra Horizontal Border): border() Controls the borders between windows. The first two parameters determine the distance between windows. The last two parameters determine the gap between the window edges and the monitor edge. *Note The gap between the window and the monitor edges is added to the regular border.

border(Vertical and Horizontal Border, Extra Vertical and Horizontal Border): Combines the first two and last two parameters in the command above into 2 parameters.

taskbar(Monitor,Top Taskbar, Bottom Taskbar, Left taskbar, Right Taskbar): taskbar() allows you to tell qt that you have a taskbar on your monitor and that it should not place windows ove it. The first parameter is the monitor you are going to define taskbars for. The next 4 parameters are the height of your taskbar at different locations on your monitor.

removeTitle(): removeTitle() tells qt to automatically remove titlebars from windows when they are created. It does not take any parameters.

exclusion(Window Class 1, Window Class 2, ..., Window Class n): exclusion() tells qt what Window Class's it should ignore when creating windows. By default the config contains several classes that qt should ignore. It can take an infinite number of parameters.

speed(Batch Speed, Window Speed, Key Speed): speed() effects the delay of things in the script. The first parameter determines how often the script takes a break (http://l.autohotkey.net/docs/commands/SetBatchLines.htm). If this parameter does not include the "ms" ending to define it as milliseconds, the script will interpret it as lines instead of milliseconds. This can severally slow down qt. The Second parameter sets the delay when moving windows (http://l.autohotkey.net/docs/commands/SetKeyDelay.htm). The Third parameter is the delay when clicking keys (http://l.autohotkey.net/docs/commands/SetWinDelay.htm). The last two parameters do not require the "ms" ending.

stack(Top and Bottom Stack Ratio, Left and Right Stack Ratio): stack() determines the ratio between the main window and the side windows. The Main window is always (n - 1)/n, where n is the ratio you set.

negBorder(Window Borders): negBorder() is a replacement to border(). negBorder only receives 1 parameter and it is the width of your window borders. negBorder() will make it so that your window borders overlap in such a way that the become half the size. negBorder() only looks good with windows classic and certain Custom Visual Styles(VS).

You can also add comments to your config file via ";" if you feel the need to.


Todo List:
Add hotkeys to move windows around in the window list. (# + Ctrl + Left: Move Window one position Left. # + Ctrl + Right: Move Window one position right. # + Ctrl + Up: Move Window to the first position. # + Ctrl + Down: Move Window to the last position.)
Add hotkeys to move windows around in the window list. (# + Left: Activate window to the left. # + Right: Activate window to the right. # + Up: Activate the first window. # + Dow: Activate the last window)
Add Foobar2000 Support (Taskbar Plugin)
Add Icon Support (Taskbar Plugin)