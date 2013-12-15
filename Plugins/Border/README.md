Border
======

Border adds the ability to toggle between two border states.



Install
-------

To install add the following lines of code to the bottom of Main.ahk.

#include Plugins\\Border\\Border.ahk

After that add this command to your config file.

-   toggleBor(Border cmd 1 & Border cmd 2): The two parameters are the two
    different border states you can have. To make a border state, use either the
    default border command negBorder() or border(). Make sure to put "&" between
    the commands and not a ","Example toggleBor(negBorder(2)&border(5,5,5,5))



Hotkeys
-------

-   # + C: Flip between the border states.
