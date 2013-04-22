qt.pi is a small window tiler/manager written in AHK. It is still very much a work in progress, but I like to share my projects while they are still in development. Currently it is more of a window tiler then a manager, though the basic manager functions are on their way. 

To use this program in it's alpha state, you must have AutoHotkey_L installed. The non "_L" version will not work, because the manager takes advantage of "_L" array and object system. As well as "_L" you must have nircmd installed if you want to use the sound control keys.

Before you use qt.pi for the first time it is advised you play with the config.txt file. In this file you can set all of your specific options to fit your taste.

https://github.com/Vibex/qt.pi

***Current Features***
1. Support for 3 monitors.
2. 3 different layouts each with their own specifically designed purpose.
3. Sound Control (with nircmd installed).
4. Tons of options to customize all the layouts to fit your specific needs.
5. And tons more that I'm to lazy to write. :)

***To Do List***
1. Ability to store window names so that they are automatically placed if you add them to a specific window list.
2. Add layouts similar to bug.n and other tilers/window managers.
3. Add Horizontal and Vertical on the fly size edits.
4. Whatever anyone else asks me to add.



Hotkeys
The way the hotkeys work is that all of the keys move the window around only on the monitor it is currently on. This allows for the control scheme to be condensed onto fewer keys then would otherwise be necesary. You can move a window between monitors by using Ctrl + Alt + (Numpad Home, Numpad Up, or Numpad PgUp).

Layout 1 Tile positions.
***xDemonessx says, "Make sure to have numlock OFF!"***
Ctrl + Numpad Home: Secondary window on your monitor (Good for file browsers and secondary programs).
Ctrl + Numpad Up: Primary window on your monitor (Good for web browsers or IDE).
Ctrl + Numpad PgUp: Fullscreen on your monitor (Good for large programs).
Ctrl + Numpad Left: Fills up the left half of your monitor with one window.
Ctrl + Numpad Clear (Center Key): Fills up the right half of your monitor with one window.
Ctrl + Numpad Right: Fills up the top half of your monitor with one window.
Ctrl + Numpad End: Fills up the bottom half of your monitor with one window.
Ctrl + Numpad Down: Center the window on your monitor. If the window doesn't fit the monitors resolution, It will resize it.
Ctrl + Numpad PgDn: Switches to the next avaliable layout.

Layout 2 Tile positions.
***xDemonessx says, "Make sure to have numlock OFF!"***
Ctrl + Numpad Home: Secondary window on your monitor (Good for file browsers and secondary programs).
Ctrl + Numpad Up: Primary window on your monitor (Good for web browsers or IDE).
Ctrl + Numpad PgUp: Fullscreen on your monitor (Good for large programs).
Ctrl + Numpad Left: Fills up the left half of your monitor with one window with the secondary window active.
Ctrl + Numpad Clear (Center Key): Fills up the right half of your monitor with one window with the secondary window active.
Ctrl + Numpad Right: Fills up the top half of your monitor with one window with the secondary window active.
Ctrl + Numpad End: Fills up the bottom half of your monitor with one window with the secondary window active.
Ctrl + Numpad Down: Center the window on your monitor. If the window doesn't fit the monitors resolution, It will resize it.
Ctrl + Numpad PgDn: Switches to the next avaliable layout.

Layout 3 Tile positions.
***xDemonessx says, "Make sure to have numlock OFF!"***
Ctrl + Numpad Home: Secondary window on your monitor (Good for file browsers and secondary programs).
Ctrl + Numpad Up: Primary window on your monitor (Good for web browsers or IDE).
Ctrl + Numpad PgUp: Fullscreen on your monitor (Good for large programs).
Ctrl + Numpad Left: Places a small window at the top next to the secondary window.
Ctrl + Numpad Clear (Center Key): Places a window next to the Ctrl + Numpad Left position.
Ctrl + Numpad Right: Places a window next to the Ctrl + Numpad Clear position.
Ctrl + Numpad End: Fills up the extra space beneath the horizontally placed windows.
Ctrl + Numpad Down: Center the window on your monitor. If the window doesn't fit the monitors resolution, It will resize it.
Ctrl + Numpad PgDn: Switches to the next avaliable layout.

Layout 4 Tile positions.
***xDemonessx says, "Make sure to have numlock OFF!"***
***Specifically designed for vertical monitors, but is pretty nice on horizontal monitors too.***
Ctrl + Numpad Home: A secondary window above your main window.
Ctrl + Numpad Up: Primary window beneath your secondary window.
Ctrl + Numpad PgUp: Fullscreen on your monitor (Good for large programs).
Ctrl + Numpad Left: A window in the same position as the secondary window, but half the width.
Ctrl + Numpad Clear (Center Key): A window with the same dimensions as the Ctrl + Numpad Left key but next to it.
Ctrl + Numpad Right: Places a window beneath the Ctrl + Numpad Left position.
Ctrl + Numpad End: Places a window beneath the Ctrl + Numpad Clear position.
Ctrl + Numpad Down: Center the window on your monitor. If the window doesn't fit the monitors resolution, It will resize it.
Ctrl + Numpad PgDn: Switches to the next avaliable layout.

Switch Monitor Keys.
***xDemonessx says, "Make sure to have numlock OFF!"***
Ctrl + Alt + Numpad Home: Moves the window to full size on the left most monitor.
Ctrl + Alt + Numpad Up: Moves the window to full size on the main monitor.
Ctrl + Alt + PgUp: Moves the window to full size on the right most monitor.

Layout Keys.
***xDemonessx says, "Make sure to have numlock ON!"***
Ctrl + Alt + 1: Change layout to setup 1.
Ctrl + Alt + 2: Change layout to setup 2.
Ctrl + Alt + 3: Change layout to setup 3.
Ctrl + Alt + 4: Change layout to setup 4.
	
Sound control
Ctrl + Numpad Plus: Increase volume.
Ctrl + Numpad Subtract: Decrease volume.
Ctrl + Numpad Enter: Mute volume.

Disable Monitor Keys
Ctrl + Shift + 1 OR Ctrl + Shift + Numpad Home: Disable left most monitor.
Ctrl + Shift + 2 OR Ctrl + Shift + Numpad Up: Disable main monitor.
Ctrl + Shift + 3 OR Ctrl + Shift + Numpad PgUp: Disable right most monitor.

Other
Ctrl + Down: This causes the window to take the entire vertical height of a window. This is especially useful on the smaller windows on layouts 3 and 4.
Ctrl + Alt + F: Set the selected window to float (remove it from the window list).
Ctrl + Alt + R: Reread the config file without closing the script.