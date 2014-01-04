Explorer
========

Explorer adds Windows explorer support to qt. You can toggle on and of the
taskbar and have the windows react to its appearance.

Install
-------

To install add the following lines of code to the bottom of Main.ahk.

-   #include Plugins\\Explorer\\Explorer.ahk

After that add this command to your config file.

-   toggleBar(Position, Size): The first parameter is the position of your
    Windows Taskbar. 1 is the top, 2 is the bottom, 3 is the left, and 4 is the
    right. All of these positions are assumed to be on the first monitor. The
    second parameter is the size of the taskbar.



Hotkeys
-------

-   # + H: Toggle the Windows taskbar.
