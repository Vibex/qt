qt 
===

qt is a simple WM built in Auto Hot Key (AHK). I tried to keep it as minimal as
possible (currently under 700 lines) while still being simple to use and easy to
expand on. By default it has six layouts, top stack, bottom stack, left stack,
right stack, monocle, and float. More layouts can easily be added if you have a
basic understanding of AHK.

If you need help in development please read over the Plugins tutorial (not yet
written).

Colemak layout uses the keys that corespond position wise to QWERTY.



Hotkeys 
--------

qt has 17 default hotkeys, and more are added via plugins. # means  the Windows
Key.

-   # + A: Activates Left Stack Layout.

-   # + S: Activates Bottom Stack Layout.

-   # + D: Activates Top Stack Layout.

-   # + F: Activates Right Stack Layout.

-   # + Q: Activates Monocle Layout.

-   # + W: Activates Float Layout.

-   # + 1: Move to workspace 1.

-   # + 2: Move to workspace 2.

-   # + 3: Move to workspace 3.

-   # + 4: Move to workspace 4.

-   # + 5: Move to workspace 5.

-   # + 6: Move to workspace 6.

-   # + 7: Move to workspace 7.

-   # + 8: Move to workspace 8.

-   # + 9: Move to workspace 9.

-   # + Z: Tile the window.

-   # + X: Untile the window.



Config
------

To change your qt settings you must edit the config.txt file in the Data folder.
qt uses commands to change settings which makes it easy for plugins to add
options but isn't the most intuitive for beginers (A GUI config is planned, but
not yet in development). To use a command simply type the cmd(X1,X2,X3,...,Xn)
where cmd is the name of the command and x are the parameters. You can also add
comments to your config file via ";" if you feel the need to.



### Border

-   border(Vertical Border, Horizontal Border, Extra Vertical Border, Extra
    Horizontal Border): border() controls the borders between windows. The first
    two parameters determine the distance between windows. The last two
    parameters determine the gap between the window edges and the monitor edge.
    \*Note The gap between the window and the monitor edges is added to the
    regular border.

-   border(Vertical and Horizontal Border, Extra Vertical and Extra Horizontal
    Border): Combines the first two and last two parameters in the command above
    into 2 parameters.



### Taskbar

-   taskbar(Monitor, Top Taskbar, Bottom Taskbar, Left taskbar, Right Taskbar):
    taskbar() allows you to tell qt that you have a taskbar on your monitor and
    that it should not place windows over them. The first parameter is the
    monitor you are going to define taskbars for. The next 4 parameters are the
    height of your taskbar at different locations on your monitor.



### Remove Title

-   removeTitle(): removeTitle() tells qt to automatically remove titlebars from
    windows when they are created. It does not take any parameters.



### Exclusion

-   exclusion(Window Class 1, Window Class 2, ..., Window Class n): exclusion()
    tells qt what Window Class's it should ignore when creating windows. By
    default the config contains several classes that qt should ignore. It can
    take an infinite number of parameters.



### Speed

-   speed(Batch Speed, Window Speed, Key Speed): speed() effects the delay of
    things in the script. The first parameter determines how often the script
    takes a break. If this parameter does not include the "ms" ending to define
    it as milliseconds, the script will interpret it as lines instead of
    milliseconds. This can severely slow down qt. The Second parameter sets the
    delay when moving windows. The Third parameter is the delay when using
    hotkeys. Make sure not to include the "ms" ending on the last two
    parameters.



### Stack

-   stack(Top and Bottom Stack Ratio, Left and Right Stack Ratio): stack()
    determines the ratio between the main window and the side windows. The Main
    window is always (n - 1)/n, where n is the ratio you set.



### Neg Border

-   negBorder(Window Borders): negBorder() is a replacement to border().
    negBorder only receives 1 parameter and it is the width of your window
    borders. negBorder() will make it so that your window borders overlap in
    such a way that they become half the size. negBorder() only looks good with
    windows classic and certain Custom Visual Styles.



### Workspace

-   workspace(Number of Workspaces): workspace() sets the number of workspaces
    qt keeps track of. This can be a number between 1 and 9.



Todo List
---------

-   Add Dvorak Layout.

-   Add Plugin Development documentation.

-   Add GUI config editor.

-   Add Fibonacci spiral and Dwindle layout (Fibonacci Plugin).

-   Add Foobar2000 Support (Taskbar Plugin)

-   Add Icon Support (Taskbar Plugin)



Change Log
----------



### 0.2.1

-   Improved documentation.

-   Fixed minimized window tiling.



### 0.2.0

-   Added an option to use fewer then 9 workspaces.

-   Added floating window layout.

-   Added Navigation plugin.

-   Added Mono space font support to Taskbar plugin.

-   Changed the default hotkeys.

-   Changed Split plugin hotkeys.

-   Improved window management.

-   Improved quality of mouse plugin.

-   Fixed Mouse plugin bugs.

-   Fixed empty space in layouts bug.



### 0.1.1	

-   Added Colemak Layout

-   Added Plugin to toggle Borders around Windows

-   Added Colemak Layout to Split Plugin

-   Added Icons to be used in future releases

-   Added return statement information to the main config methods

-   Improved Mouse Plugin

-   Improved Taskbar Plugin

-   Improved Window removal detection



### 0.1.0 

-   Original Release
